import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/local/my_shared_pref.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

class MyTheme {
  static getThemeData({required bool isLight}) {
    return ThemeData(
      useMaterial3: false,
      primaryColor: isLight
          ? LightThemeColors.primaryColor
          : DarkThemeColors.primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: isLight
            ? LightThemeColors.accentColor
            : DarkThemeColors.accentColor,
        backgroundColor: isLight
            ? LightThemeColors.backgroundColor
            : DarkThemeColors.backgroundColor,
        brightness: isLight ? Brightness.light : Brightness.dark,
      ).copyWith(
        secondary: isLight
            ? LightThemeColors.accentColor
            : DarkThemeColors.accentColor,
      ),
      brightness: isLight ? Brightness.light : Brightness.dark,
      cardColor:
          isLight ? LightThemeColors.cardColor : DarkThemeColors.cardColor,
      hintColor: isLight
          ? LightThemeColors.hintTextColor
          : DarkThemeColors.hintTextColor,
      dividerColor: isLight
          ? LightThemeColors.dividerColor
          : DarkThemeColors.dividerColor,
      canvasColor:
          isLight ? LightThemeColors.canvasColor : DarkThemeColors.canvasColor,

      // Set both scaffoldBackgroundColor and backgroundColor
      scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: isLight
            ? LightThemeColors.primaryColor
            : DarkThemeColors.primaryColor,
      ),
      appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),
      elevatedButtonTheme:
          MyStyles.getElevatedButtonTheme(isLightTheme: isLight),
      textTheme: MyStyles.getTextTheme(isLightTheme: isLight),
      chipTheme: MyStyles.getChipTheme(isLightTheme: isLight),
      iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),
    );
  }

  /// update app theme and save theme type to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static changeTheme() {
    // *) check if the current theme is light (default is light)
    bool isLightTheme = MySharedPref.getThemeIsLight();

    // *) store the new theme mode on get storage
    MySharedPref.setThemeIsLight(!isLightTheme);

    // *) let GetX change theme
    Get.changeThemeMode(!isLightTheme ? ThemeMode.light : ThemeMode.dark);
  }

  /// check if the theme is light or dark
  bool get getThemeIsLight => MySharedPref.getThemeIsLight();
}
