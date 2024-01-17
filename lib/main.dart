import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/localisation/languages.dart';
import 'package:wellnessz_app/resources/routes/routes.dart';
import 'data/notifications/local_notifications.dart';
import 'data/notifications/push_notification.dart';
import 'firebase_options.dart';

SharedPreferences? sp;
Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  sp = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HttpOverrides.global = MyHttpOverrides();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  analytics.app;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  LocalNotificationServices().initialiseNotifications();
  await FirebasePushNotification().initNotification();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WellnessZ',
      getPages: AppRoutes.appRoutes(),
      translations: Languages(),
      debugShowCheckedModeBanner: false,
      locale: const Locale('en','US'),
      theme: AppColor.lightTheme,
      darkTheme: AppColor.darkTheme,
      themeMode: ThemeMode.system,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ],
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
