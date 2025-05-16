import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_standard/utils/app_spacer.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.AssetPath,
    required this.ColorContainer,
  });

  final String title;
  final String subtitle;
  final String AssetPath;
  final Color ColorContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 55.h,
            width: 55.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorContainer,
              shape: BoxShape.rectangle,
            ),
            child: Center(
              child: Image.asset(
                AssetPath,
                height: 30.h,
                width: 30.w,
              ),
            ),
          ),
          AppSpacer(widthRatio: 0.5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  )),
              Text(subtitle,
                  style: TextStyle(color: Colors.black54, fontSize: 10.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
