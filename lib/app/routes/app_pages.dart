import 'package:get/get.dart';
import 'package:getx_standard/app/modules/dashbaord/views/dashboard.dart';
import 'package:getx_standard/app/modules/dashbaord/views/home_screen.dart';

import '../modules/auth/view/sign_in.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/splash/splash_screen.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const DASHBOARD = Routes.DASHBOARD;
  static const SPLASH = Routes.SPLASH;
  static const OnboardingScreen = Routes.Onboarding;
  static const SignInScreen = Routes.SignIn;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      // binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.OnboardingScreen,
      page: () => OnboardingScreenNew(),
      // binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SignInScreen,
      page: () => Signin(),
      // binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD, // <-- Add this block
      page: () => Dashboard(),
    ),
  ];
}
