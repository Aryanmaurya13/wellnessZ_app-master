
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/data/shared_preferences/local_storage_functions.dart';
import 'package:wellnessz_app/data/shared_preferences/storage_keys.dart';
import 'package:wellnessz_app/resources/routes/route_names.dart';
import 'package:wellnessz_app/utils/tools/debug_tools/debug_tools.dart';

class UserTypeController extends GetxController{
  RxBool isClient = false.obs;
  RxBool isCoach = false.obs;
  RxBool isLightTheme = false.obs;


  @override
  void onInit() {
    getThemeStatus();
    super.onInit();
  }

  void continueOnTap()async{
    HapticFeedback.heavyImpact();
    await setDataToLocalStorage(dataType: StorageKey.boolType, prefKey: StorageKey.isCoach, boolData: isCoach.value);
    kDebugPrint("Is Coach - ${isCoach.value}");
    Get.toNamed(RouteName.sigInView,arguments: {
      "isCoach":isCoach.value
    });
  }

  getThemeStatus()async{
    isLightTheme.value = await getDataFromLocalStorage(dataType: StorageKey.boolType, prefKey: StorageKey.isLightTheme);
    kDebugPrint(isLightTheme.value);
  }


}