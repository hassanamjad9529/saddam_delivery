import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.amount,
    required this.label,
    required this.AssetPath,
  });

  final String amount;
  final String label;
  final String AssetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/dashboard/container_background.png'),
          fit: BoxFit.cover,
        ),
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlueAccent],
        ),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 65.h,
              width: 65.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Image.asset(
                  AssetPath,
                  height: 40.h,
                  width: 40.w,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(amount,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                // Split the label into words and display 3 on the first line, rest on the second
                Builder(
                  builder: (context) {
                    final words = label.split(' ');
                    final firstLine = words.take(4).join(' ');
                    final secondLine =
                        words.length > 3 ? words.skip(3).join(' ') : '';
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(firstLine,
                            style: TextStyle(
                                color: Colors.white70, fontSize: 12.sp)),
                        if (secondLine.isNotEmpty)
                          Text(secondLine,
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12.sp)),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
