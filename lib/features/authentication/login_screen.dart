import 'package:clone/constants/gaps.dart';
import 'package:clone/constants/sizes.dart';
import 'package:clone/features/authentication/login_form_screen.dart';
import 'package:clone/features/authentication/signup_screen.dart';
import 'package:clone/features/authentication/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef SignupButtonType = ({
  FaIcon icon,
  String text,
});

const List<SignupButtonType> signupButtonData = [
  (
    icon: FaIcon(FontAwesomeIcons.user, size: Sizes.size20),
    text: 'Use email & password',
  ),
  (
    icon: FaIcon(FontAwesomeIcons.apple, size: Sizes.size20),
    text: 'Continue with Apple',
  ),
];

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onTapMoveToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  void _onTapMoveToLoginForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.v28,
                Text(
                  'Log in to TikTok',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.size24,
                  ),
                ),
                Gaps.v16,
                Text(
                  'Manage your account, check notifications, comment on videos, and more.',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: Sizes.size16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gaps.v24,
                ...List.generate(
                  signupButtonData.length,
                  (index) => Column(
                    children: [
                      ...[
                        if (index == 0)
                          GestureDetector(
                            onTap: () => _onTapMoveToLoginForm(context),
                            child: SignupButton(
                              icon: signupButtonData[index].icon,
                              text: signupButtonData[index].text,
                            ),
                          )
                        else
                          SignupButton(
                            icon: signupButtonData[index].icon,
                            text: signupButtonData[index].text,
                          ),
                      ],
                      if (index != signupButtonData.length - 1) Gaps.v10
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.h3,
            GestureDetector(
              onTap: () => _onTapMoveToSignup(context),
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
