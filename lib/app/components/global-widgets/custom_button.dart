import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableCustomButton extends StatelessWidget {
  final String text;
  final Color color;             // Button background color
  final Color? textColor;        // Optional text color
  final VoidCallback onPressed;

  const ReusableCustomButton({
    super.key,
    required this.text,
    required this.color,
    this.textColor,              // Optional
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15.sp,
            color: textColor ?? Colors.white, // Default to white if not passed
          ),
        ),
      ),
    );
  }
}
