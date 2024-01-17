import 'dart:convert';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wellnessz_app/data/network/network_helper.dart';
import 'package:wellnessz_app/data/shared_preferences/local_storage_functions.dart';
import 'package:wellnessz_app/data/shared_preferences/storage_keys.dart';
import 'package:wellnessz_app/models/login_models/coach_login_model.dart';
import 'package:wellnessz_app/resources/app_urls/app_urls.dart';
import 'package:wellnessz_app/utils/loaders%20&%20dialogs/loaders.dart';
import 'package:wellnessz_app/utils/tools/debug_tools/debug_tools.dart';
import 'package:wellnessz_app/utils/tools/snackbars/snackbar.dart';
import 'login_services.dart';

class LoginRepository extends LoginServices {
  HttpHandler helper = HttpHandler();

  @override
  Future signInPhone(Map<String,dynamic> data) async{
    showLoadingDialog();
    var response = await helper.postHttpMethod(url: AppUrl.signInMobile, data: data);
    var responseData = jsonDecode(response["body"]);
    kDebugPrint("responseData :::::: $responseData");
    if (responseData["status"] == true ) {
      CoachLoginModel coachLoginModel = CoachLoginModel.fromJson(responseData);
      await setDataToLocalStorage(dataType: StorageKey.stringType, prefKey: StorageKey.token, stringData: coachLoginModel.data?.user?.refreshToken);
      await setDataToLocalStorage(dataType: StorageKey.jsonObjectString, prefKey: StorageKey.userDetails, jsonData: jsonEncode(coachLoginModel.data));
      await setDataToLocalStorage(dataType: StorageKey.boolType,prefKey:StorageKey.isFirstTime,boolData: coachLoginModel.data?.isFirstTime) ;
      await setDataToLocalStorage(dataType: StorageKey.stringType,prefKey:StorageKey.coachId,stringData: coachLoginModel.data?.user?.coachId) ;
      kDebugPrint("responseData :::::: $responseData");
      hideLoadingDialog();
      return true;
    } else if (responseData['status_code'] == 400) {
      hideLoadingDialog();
      kDebugPrint("----------> Something went wrong - 400");
      return false;
    }
    else if(responseData["status"]==false){
      hideLoadingDialog();
      CustomSnackBar.errorSnackBar(context: Get.context);
      return false;
    }
    else {
      hideLoadingDialog();
      kDebugPrint("----------> ELSE");
      return false;
    }
  }

  @override
  Future signInCoachCode(Map<String,dynamic> data) async{
    showLoadingDialog();
    var response = await helper.postHttpMethod(url: AppUrl.signInClientCode, data: data);
    var responseData = jsonDecode(response["body"]);
    kDebugPrint("responseData :::::: $responseData");

    if (responseData["status"] == true) {
      kDebugPrint("responseData :::::: $responseData");
      hideLoadingDialog();
      return true;
    } else if (responseData['status_code'] == 400) {
      hideLoadingDialog();
      kDebugPrint("----------> Something went wrong - 400");
      return false;
    }
    else if(responseData["status"]==false){
      hideLoadingDialog();
      CustomSnackBar.errorSnackBar(context: Get.context);
      return false;
    }
    else {
      hideLoadingDialog();
      kDebugPrint("----------> ELSE");
      return false;
    }
  }

  @override
  Future signInGoogle() async{
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    await googleSignIn.signOut();
    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final GoogleSignInAuthentication googleAuthentication = await googleAccount.authentication;
      bool isSignedIn = await googleSignIn.isSignedIn();
      kDebugPrint("googleAccount - $googleAccount");
      kDebugPrint("googleSignIn status - $isSignedIn");
      kDebugPrint("google Access Token - ${googleAuthentication.accessToken}");
      if(isSignedIn) {
        showLoadingDialog();
        Map<String, dynamic> googleData = {
          "displayName": googleAccount.displayName ?? "",
          "email": googleAccount.email,
          "id": googleAccount.id,
          "photoUrl": googleAccount.photoUrl ?? "",
          "serverCodeAuth": googleAccount.serverAuthCode ?? "",
          "googleAccessToken": googleAuthentication.accessToken ?? "",
        };
        // Map<String,dynamic> data = {
        //   "credential": googleData,
        //   "person":"coach"
        // };
        var response = await helper.postHttpMethod(
            url: AppUrl.signInGoogle, data: googleData);
        var responseData = jsonDecode(response["body"]);
        kDebugPrint("responseData :::::: $responseData");

        if (responseData["status"] == true) {
          CoachLoginModel coachLoginModel = CoachLoginModel.fromJson(responseData);
          await setDataToLocalStorage(dataType: StorageKey.stringType, prefKey: StorageKey.token, stringData: coachLoginModel.data?.user?.refreshToken);
          await setDataToLocalStorage(dataType: StorageKey.jsonObjectString, prefKey: StorageKey.userDetails, jsonData: jsonEncode(coachLoginModel.data));
          await setDataToLocalStorage(dataType: StorageKey.boolType,prefKey:StorageKey.isFirstTime,boolData: coachLoginModel.data?.isFirstTime) ;
          await setDataToLocalStorage(dataType: StorageKey.stringType,prefKey:StorageKey.coachId,stringData: coachLoginModel.data?.user?.coachId) ;
          kDebugPrint("responseData :::::: $responseData");
          hideLoadingDialog();
          return googleAccount.displayName;
        } else if (responseData['status_code'] == 400) {
          hideLoadingDialog();
          kDebugPrint("----------> Something went wrong - 400");
          return false;
        }
        else if (responseData["status"] == false) {
          hideLoadingDialog();
          CustomSnackBar.errorSnackBar(context: Get.context);
          return false;
        }
        else {
          hideLoadingDialog();
          kDebugPrint("----------> ELSE");
          return false;
        }
      }
    } else {
      kDebugPrint("User canceled Google sign-in");
    }
  }

  @override
  Future coachRegister(Map<String, dynamic> data) async{
    showLoadingDialog();
    var response = await helper.postHttpMethod(url: AppUrl.coachRegistration, data: data);
    var responseData = jsonDecode(response["body"]);
    kDebugPrint("responseData :::::: $responseData");
    if (responseData["status"] == true ) {
      //TODO: Functions to be perform
      kDebugPrint("responseData :::::: $responseData");
      hideLoadingDialog();
      return true;
    } else if (responseData['status_code'] == 400) {
      hideLoadingDialog();
      kDebugPrint("----------> Something went wrong - 400");
      return false;
    }
    else if(responseData["status"]==false){
      hideLoadingDialog();
      CustomSnackBar.errorSnackBar(context: Get.context);
      return false;
    }
    else {
      hideLoadingDialog();
      kDebugPrint("----------> ELSE");
      return false;
    }
  }

  @override
  Future otpVerify(Map<String, dynamic> data) async{
    showLoadingDialog();
    var response = await helper.postHttpMethod(url: AppUrl.verifyOtp, data: data);
    var responseData = jsonDecode(response["body"]);
    kDebugPrint("responseData :::::: $responseData");
    if (responseData["status"] == true ) {
      kDebugPrint("responseData :::::: $responseData");
      hideLoadingDialog();
      return true;
    } else if (responseData['status_code'] == 400) {
      hideLoadingDialog();
      kDebugPrint("----------> Something went wrong - 400");
      return false;
    }
    else if(responseData["status"]==false){
      hideLoadingDialog();
      CustomSnackBar.errorSnackBar(context: Get.context);
      return false;
    }
    else {
      hideLoadingDialog();
      kDebugPrint("----------> ELSE");
      return false;
    }
  }



}
