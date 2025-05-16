import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomToggleButtons extends StatefulWidget {
  final ValueChanged<bool> onToggle;

  const CustomToggleButtons({super.key, required this.onToggle});

  @override
  State<CustomToggleButtons> createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  bool isDriver = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 46.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), // Reduced to 8 for consistency
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Driver Button
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDriver = true;
                  });
                  widget.onToggle(true);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: isDriver ? Colors.white : Colors.transparent,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(3),
                      bottomLeft: Radius.circular(3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center content
                    children: [
                      isDriver
                          ? Image.asset(
                          height: 25.h,
                          width: 25.w,
                          "assets/images/auth/steering4x.png")                          : const SizedBox.shrink(),
                      const SizedBox(width: 8),
                      Text(
                        'Driver',
                        style: TextStyle(
                          color: isDriver ? Colors.black : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Client Button
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDriver = false;
                  });
                  widget.onToggle(false);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: isDriver ? Colors.transparent : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(3),
                      bottomRight: Radius.circular(3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center content
                    children: [
                      isDriver
                          ?  SizedBox.shrink()
                          :Image.asset(
                          height: 25.h,
                          width: 25.w,
                          "assets/images/auth/client4x.png") ,
                      const SizedBox(width: 8),
                      Text(
                        'Client',
                        style: TextStyle(
                          color: isDriver ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}