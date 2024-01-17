
import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/data/shared_preferences/local_storage_functions.dart';
import 'package:wellnessz_app/data/shared_preferences/storage_keys.dart';
import 'package:wellnessz_app/resources/routes/route_names.dart';
import 'package:wellnessz_app/utils/tools/debug_tools/debug_tools.dart';

class SplashServices{

  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics.instance;

  void logAppOpen() async {
    await _firebaseAnalytics.logAppOpen();
  }

  void getThemeStatus() async {
    bool? isLightTheme = await getDataFromLocalStorage(dataType: StorageKey.boolType, prefKey: StorageKey.isLightTheme);
    kDebugPrint("is Light Theme - $isLightTheme ");
    Get.changeThemeMode((isLightTheme??!(Get.isDarkMode)) ? ThemeMode.light : ThemeMode.dark);
    kDebugPrint(Get.isDarkMode);
    if(isLightTheme==null){
      await setDataToLocalStorage(dataType: StorageKey.boolType, boolData: isLightTheme, prefKey: StorageKey.isLightTheme);
    }
  }

  void setAnalyticsProperties() async {
    await _firebaseAnalytics.setUserId(id: '0001');
    await _firebaseAnalytics.setUserProperty(
      name: 'favorite_color',
      value: 'pink',
    );
  }

  void navigateScreen()async{
    bool? isLogin = await getDataFromLocalStorage(dataType: StorageKey.boolType, prefKey: StorageKey.isLogin);
    String? token = await getDataFromLocalStorage(dataType: StorageKey.stringType, prefKey: StorageKey.token);
    if((isLogin??false) && token!=null){
      Timer(const Duration(seconds: 5), () {
        Get.offAllNamed(RouteName.introView);
      });
    }else {
      Timer(const Duration(seconds: 5), () {
        Get.offAllNamed(RouteName.introView);
      });
    }
  }

}