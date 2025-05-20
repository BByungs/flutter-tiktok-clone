import 'package:clone/constants/gaps.dart';
import 'package:clone/constants/sizes.dart';
import 'package:clone/features/onboarding/tutorial_screen.dart';
import 'package:clone/features/onboarding/widgets/interest_button.dart';
import 'package:flutter/material.dart';

const interests = [
  'Daily life',
  'Comedy',
  'Entertainment',
  'Animals',
  'Food',
  'Art',
  'Beauty & Style',
  'Drama',
  'Learning',
  'Talent',
  'Auto',
  'Family',
  'Fitness & Health',
  'DIY & Life Hacks',
  'Arts & Crafts',
  'Dance',
  'Outdoors',
  'Daily life',
  'Comedy',
  'Entertainment',
  'Animals',
  'Food',
  'Art',
  'Beauty & Style',
  'Drama',
  'Learning',
  'Talent',
  'Auto',
  'Family',
  'Fitness & Health',
  'DIY & Life Hacks',
  'Arts & Crafts',
  'Dance',
  'Outdoors',
  'Daily life',
  'Comedy',
  'Entertainment',
  'Animals',
  'Food',
  'Art',
  'Beauty & Style',
  'Drama',
  'Learning',
  'Talent',
  'Auto',
  'Family',
  'Fitness & Health',
  'DIY & Life Hacks',
  'Arts & Crafts',
  'Dance',
  'Outdoors',
  'Daily life',
  'Comedy',
  'Entertainment',
  'Animals',
  'Food',
  'Art',
  'Beauty & Style',
  'Drama',
  'Learning',
  'Talent',
  'Auto',
  'Family',
  'Fitness & Health',
  'DIY & Life Hacks',
  'Arts & Crafts',
  'Dance',
  'Outdoors',
  'Daily life',
  'Comedy',
  'Entertainment',
  'Animals',
  'Food',
  'Art',
  'Beauty & Style',
  'Drama',
  'Learning',
  'Talent',
  'Auto',
  'Family',
  'Fitness & Health',
  'DIY & Life Hacks',
  'Arts & Crafts',
  'Dance',
  'Outdoors',
  'Daily life',
  'Comedy',
  'Entertainment',
  'Animals',
  'Food',
  'Art',
  'Beauty & Style',
  'Drama',
  'Learning',
  'Talent',
  'Auto',
  'Family',
  'Fitness & Health',
  'DIY & Life Hacks',
  'Arts & Crafts',
  'Dance',
  'Outdoors',
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onTutorialTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TutorialScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedOpacity(
            opacity: _showTitle ? 1 : 0,
            duration: Duration(microseconds: 300),
            child: Text(
              'Choose your interests',
            )),
        // scroll 했을때 elevation 생겨서 0으로 설정
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size24,
            right: Sizes.size24,
            bottom: Sizes.size24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your interests',
                style: TextStyle(
                  fontSize: Sizes.size40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v5,
              Text(
                'Get better video recommendations',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.v28,
              Wrap(
                spacing: Sizes.size10,
                runSpacing: Sizes.size10,
                children: [
                  for (var interest in interests)
                    InterestButton(interest: interest)
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // height: 80,
        child: GestureDetector(
          onTap: _onTutorialTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.size14,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Next',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: Sizes.size16),
            ),
          ),
        ),
      ),
    );
  }
}
