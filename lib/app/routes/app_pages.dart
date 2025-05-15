import 'package:get/get.dart';
import 'package:getx_standard/app/modules/home/views/dashboard.dart';
import 'package:getx_standard/app/modules/home/views/home.dart';

import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => SaddamBottomNav(),
      // binding: OnboardingBinding(),
    ),
  ];
}
