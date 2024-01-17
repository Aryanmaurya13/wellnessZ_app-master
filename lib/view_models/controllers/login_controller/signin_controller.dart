import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/repository/login_repo/login_repository.dart';
import 'package:wellnessz_app/resources/routes/route_names.dart';
import 'package:wellnessz_app/utils/tools/snackbars/snackbar.dart';
import '../../../data/shared_preferences/local_storage_functions.dart';
import '../../../data/shared_preferences/storage_keys.dart';
import '../../../utils/tools/debug_tools/debug_tools.dart';

class SignInController extends GetxController {
  RxBool isLightTheme = false.obs;
  TextEditingController inputController = TextEditingController();
  FocusNode inputNode = FocusNode();
  bool isSelected = true;
  bool isCoach = false;
  final formKey = GlobalKey<FormState>();
  LoginRepository helper = LoginRepository();

  @override
  void onInit() {
    getArguments();
    getThemeStatus();
    super.onInit();
  }

  void getArguments(){
    var arguments = Get.arguments;
    isCoach = arguments["isCoach"]??false;
  }

  getThemeStatus() async {
    isLightTheme.value = await getDataFromLocalStorage(
        dataType: StorageKey.boolType, prefKey: StorageKey.isLightTheme);
    kDebugPrint(isLightTheme.value);
  }

  void onGoogleSignIn()async{
    HapticFeedback.mediumImpact();
    var result = await helper.signInGoogle();
    if(result != false){
      CustomSnackBar.successSnackBar(context: Get.context);
      await Future.delayed(const Duration(seconds: 2));
      bool? isFirstTime = await getDataFromLocalStorage(dataType: StorageKey.boolType, prefKey: StorageKey.isFirstTime);
      if(isFirstTime??true){
        Get.toNamed(RouteName.registrationView,arguments: {
          "name":result
        });
      }else{
        Get.offAllNamed(RouteName.clientHomeView,arguments: {
          "name":result
        });
      }

    }
  }

  void onSignIn()async{
    if(formKey.currentState!.validate()){
      HapticFeedback.lightImpact();
      if(isCoach) {
        Map<String, dynamic> data = {
          "credential": "+91${inputController.text}",
          "person": "coach"
        };
        var result = await helper.signInPhone(data);
        if(result == true){
          inputNode.unfocus();
          CustomSnackBar.successSnackBar(context: Get.context);
          await Future.delayed(const Duration(seconds: 2));
          Get.toNamed(RouteName.verifyOtpView,arguments: {
            "mobile":inputController.text
          });
        }
      }else{
        Map<String, dynamic> data = {
          "credential": inputController.text,
          "person": "client"
        };
        var result = await helper.signInCoachCode(data);
        if(result == true){
          CustomSnackBar.successSnackBar(context: Get.context);
          Get.offAllNamed(RouteName.clientHomeView,arguments: {
            "client_id":1
          });
        }
      }
    }
  }
}
