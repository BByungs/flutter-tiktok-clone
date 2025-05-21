import 'package:clone/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

// ignore: slash_for_doc_comments
/**
 * SingleTickerProviderStateMixin
 * 위젯이 화면에 보일때만 tick하는 Ticker를 제공한다
 * Ticker는 current tree가 활성화 될 때, 달리 말하면 위젯이 화면에 보일 때만 tick 하는것임
 * 
 * Ticker
 * 매 프레임마다 callback을 호출한다(부드러운 애니메이션일수록 프레임마다 animate 돼야 함)
 * 엄청나게 무거운 애니메이션이 계속 살아있으면 메모리 누수가 발생 할 수 있으니 SingleTickerProviderStateMixin을 사용하는것임
 * 
 * 정리: 정신나간 애니메이션의 매 프레임마다 실행되는 Ticker가 있는데, 대신 위젯이 화면에 보일때만(current tree가 활성화 될때) 실행되는 Ticker를 제공해줌
 */
class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/ha_nyang.mp4');

  bool _isPaused = false;

  final Duration _animationDuration = const Duration(milliseconds: 200);

  late final AnimationController _animationController;

  void _onVideoChange() {
    // 비디오가 초기화 되었는지 확인
    if (_videoPlayerController.value.isInitialized) {
      // 비디오가 끝났는지 확인
      // _videoPlayerController의 영상의 길이가 현재 영상 내의 위치인 _videoPlayerController.value.position과 같은지 확인
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    // _videoPlayerController.play();
    setState(() {});
    _videoPlayerController.addListener(_onVideoChange);
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    // 애니메이션 컨트롤러 초기화
    _animationController = AnimationController(
      // SingleTickerProviderStateMixin을 상속받아야 사용 가능하고
      // this는 SingleTickerProviderStateMixin을 상속받은 클래스의 인스턴스를 의미함
      vsync: this,
      // 기본값 1.5(value)
      // 모든 애니메이션은 lowerBound에서 시작함
      // 원한다면 upperBound에서 시작가능함
      value: 1.5,
      lowerBound: 1.0,
      upperBound: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    // 비디오 플레이어 컨트롤러 해제
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    // info.visibleFraction == 1은 비디오가 화면에 100% 보이는것을 의미함
    if (info.visibleFraction == 1 && !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      // upper bound => lower bound
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      // lower bound => upper bound
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            // IgnorePointer가 없으면, 해당 위젯의 클릭이벤트에 막혀, _onTogglePause가 실행이 안됨
            // 해당 child에 있는 widget의 이벤트를 무시함으로써 _onTogglePause를 실행할 수 있게 함
            child: IgnorePointer(
              child: Center(
                // initState에서 초기화한 _animationController를 사용하고, setState를 호출하여 빌드를 시킬 필요가 없음
                // 1. initState에서 eventlistener를 추가하여 setState를 호출하여 애니메이션 동작하는 방식
                // 2. AnimatedBuilder를 사용하여 애니메이션 동작하는 방식
                // 둘 중 하나 선택해서 사용하면 된다.
                child: AnimatedBuilder(
                  animation: _animationController,
                  // _animationController.value가 변할 때마다 실행 됨
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: _animationDuration,
                    child: FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
