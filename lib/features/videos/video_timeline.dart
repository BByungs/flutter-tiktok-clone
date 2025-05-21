import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.teal,
  ];

  void _onPageChanged(int page) {
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      colors.addAll([
        Colors.blue,
        Colors.red,
        Colors.yellow,
        Colors.teal,
      ]);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // scroll 방향 설정
      scrollDirection: Axis.vertical,
      itemCount: colors.length,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        return Container(
          color: colors[index],
          child: Center(
            child: Text(
              'Screen $index',
              style: TextStyle(
                fontSize: 68,
              ),
            ),
          ),
        );
      },
    );
  }
}
