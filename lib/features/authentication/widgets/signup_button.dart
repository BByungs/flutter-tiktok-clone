import 'package:clone/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupButton extends StatelessWidget {
  final FaIcon icon;
  final String text;

  const SignupButton({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: EdgeInsets.all(
          Sizes.size14,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: Sizes.size14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
