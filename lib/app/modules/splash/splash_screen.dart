import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay navigation after widget is built
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.Onboarding); // Navigates and removes splash from stack
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash/Splash Screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/icon-splash/spalsh_logo.svg',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
