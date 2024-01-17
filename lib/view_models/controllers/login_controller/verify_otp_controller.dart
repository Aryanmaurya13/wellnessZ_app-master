import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:wellnessz_app/repository/login_repo/login_repository.dart';
import 'package:wellnessz_app/resources/routes/route_names.dart';
import 'package:wellnessz_app/utils/tools/snackbars/snackbar.dart';

import '../../../data/shared_preferences/local_storage_functions.dart';
import '../../../data/shared_preferences/storage_keys.dart';
import '../../../utils/tools/debug_tools/debug_tools.dart';

class VerifyOtpController  extends GetxController{
 String mobileNumber = "";
  RxBool isLightTheme = false.obs;
  RxInt otpLength = 0.obs;
 String otp = '';
 OtpFieldController otpFieldController = OtpFieldController();
 RxInt otpTimerSeconds = 60.obs;

 LoginRepository helper = LoginRepository();

 void startResendTimer()async{
   otpTimerSeconds.value=60;
   update();
   Timer timer = Timer.periodic(
       const Duration(seconds: 1),
           (timer) {
         if(otpTimerSeconds.value==0){
           timer.cancel();
           return;
         }
         otpTimerSeconds.value --;
         update();
   });
 }


 void onOtpChange(value){
   kDebugPrint(value?.length);
   otpLength.value = value!.length;
   update();
 }

 void onOtpComplete(value){
   otpLength.value = value!.length;
   otp = value;
   kDebugPrint("OTP SUBMIT");
   update();
 }

 @override
  void onInit() {
   getArguments();
    getThemeStatus();
   startResendTimer();
    super.onInit();
  }

  void getArguments(){
   var arguments = Get.arguments;
   mobileNumber = arguments["mobile"];
  }

  getThemeStatus()async{
    isLightTheme.value = await getDataFromLocalStorage(dataType: StorageKey.boolType, prefKey: StorageKey.isLightTheme);
    kDebugPrint(isLightTheme.value);
    update();
  }

  void verifyOtpButton()async{
    if(otpLength.value==4){
      HapticFeedback.heavyImpact();
        Map<String, dynamic> data = {
          "mobileNumber":"+91$mobileNumber",
          "otp": otp,
          "person":"coach"
        };
        var result = await helper.otpVerify(data);
        if(result??false) {
          CustomSnackBar.successSnackBar(context: Get.context);
          bool? isFirstTime = await getDataFromLocalStorage(
              dataType: StorageKey.boolType, prefKey: StorageKey.isFirstTime);
          await Future.delayed(const Duration(seconds: 2));
          if (isFirstTime ?? true) {
            Get.toNamed(RouteName.registrationView, arguments: {
            });
          }
          else {
            Get.offAllNamed(RouteName.clientHomeView, arguments: {
              // "coach_id": inputController.text
            });
          }
        }
    }
  }

  void resendOtpButton()async{
    Map<String, dynamic> data = {
      "credential": "+91$mobileNumber",
      "person": "coach"
    };
    var result = await helper.signInPhone(data);
    if(result == true){
      CustomSnackBar.successSnackBar(context: Get.context,message: "OTP RESENT SUCCESSFULLY");
      await Future.delayed(const Duration(seconds: 2));
    }
  }

}