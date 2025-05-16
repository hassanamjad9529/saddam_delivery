import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_standard/config/theme/light_theme_colors.dart';

import '../../../components/global-widgets/custom_button.dart';
import '../../../routes/app_pages.dart';

class OnboardingScreenNew extends StatelessWidget {
  const OnboardingScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash/Splash Screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.h,
              ),
              SvgPicture.asset(
                'assets/images/icon-splash/spalsh_logo.svg',
                width: 176.w,
                height: 152.h,
              ),
              SizedBox(height: 120.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Always In Control, Always On Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Easily track your shipments, view delivery updates, and manage your routes — all from one place.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF2F2F2),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: ReusableCustomButton(
                  text: 'Get Started',
                  color: Colors.white,
                  textColor: LightThemeColors.primaryColorBlue,
                  onPressed: () {
                    print("Presed");
                    Get.offNamed(Routes
                        .SignIn); // Navigates and removes splash from stack
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
