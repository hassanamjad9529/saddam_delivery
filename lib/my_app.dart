// filepath: [my_app.dart](http://_vscodecontentref_/1)
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/modules/home/views/home.dart';

import 'app/data/local/my_shared_pref.dart';
import 'app/routes/app_pages.dart';
import 'config/theme/my_theme.dart';
import 'config/translations/localization_service.dart';

class MyApp extends GetView {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SignIn,
      getPages: AppPages.routes,
      locale: MySharedPref.getCurrentLocal(),
      translations: LocalizationService.getInstance(),
    );
  }
}