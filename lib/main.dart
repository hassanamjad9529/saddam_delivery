import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_standard/my_app.dart';

import 'app/data/local/my_shared_pref.dart';
import 'app/service/helper/network_connectivity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeApp();

  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    useInheritedMediaQuery: true,
    builder: (context, child) => MyApp(),
  ));
}

Future<void> _initializeApp() async {
  // Set device orientation to portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Initialize shared preferences
  await MySharedPref.init();

  // Initialize network connectivity listener
  Future.delayed(Duration.zero, NetworkConnectivity.initConnectivityListener);

  // Uncomment and implement as needed:
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await NotificationHelper().initNotification();
  // DeviceInfoHelper.initializeDeviceInfo();
}