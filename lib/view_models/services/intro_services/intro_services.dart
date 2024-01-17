
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/data/shared_preferences/local_storage_functions.dart';
import 'package:wellnessz_app/data/shared_preferences/storage_keys.dart';
import 'package:wellnessz_app/resources/routes/route_names.dart';


class IntroServices{
  final introKey = GlobalKey<IntroductionScreenState>();
  final RxBool isLightTheme = false.obs;
  final RxBool isThirdPage = false.obs;


  saveThemeStatus(bool saveStatusTheme) async {
    await setDataToLocalStorage(dataType: StorageKey.boolType, boolData: saveStatusTheme, prefKey: StorageKey.isLightTheme);
  }

  getThemeStatus()async{
    isLightTheme.value = await getDataFromLocalStorage(dataType: StorageKey.boolType, prefKey: StorageKey.isLightTheme);
  }

  void onIntroEnd() {
    HapticFeedback.heavyImpact();
    Get.toNamed(RouteName.userTypeView);
  }

}