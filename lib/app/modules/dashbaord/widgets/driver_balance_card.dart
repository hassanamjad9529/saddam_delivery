import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_standard/utils/constants.dart';

class DriverBalanceCard extends StatelessWidget {
  const DriverBalanceCard({
    super.key,
    required this.amount,
    required this.label,
    required this.isPositive,
  });

  final String amount;
  final String label;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 55.h,
                width: 55.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isPositive ? Color(0xffd9efe9) : Color(0xfffbd9df),
                  shape: BoxShape.rectangle,
                ),
                child: Center(
                  child: Image.asset(
                    isPositive
                        ? DashboardImages.trendingUpPng
                        : DashboardImages.trendingUpPng,
                    color: isPositive ? Colors.green : Colors.red,
                    height: 35.h,
                    width: 35.h,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Column(
            children: [
              Text(
                "View all",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
              Center(
                child: Image.asset(
                  isPositive
                      ? DashboardImages.trendingUpPng
                      : DashboardImages.trendingUpPng,
                  color: isPositive ? Colors.green : Colors.red,
                  height: 25.h,
                  width: 25.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
