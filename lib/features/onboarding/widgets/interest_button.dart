import 'package:clone/constants/sizes.dart';
import 'package:flutter/material.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size24),
          border: Border.all(
            // color: Colors.black.withOpacity(0.1),
            color: Colors.black.withValues(alpha: 0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size10,
          ),
          child: Text(
            widget.interest,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size12,
              color: _isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
