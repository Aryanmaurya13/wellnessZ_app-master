import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/data/shared_preferences/local_storage_functions.dart';
import 'package:wellnessz_app/data/shared_preferences/storage_keys.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';

class CustomDialogs{
//TODO:IMPROVE THIS DIALOG
  static appDialog({String? title, String? subHead, VoidCallback? onClickYes})async{
    bool isLightTheme = await getDataFromLocalStorage(dataType: StorageKey.boolType,prefKey: StorageKey.isLightTheme);
    showDialog(
        context: Get.context!,
        builder: (context){
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            alignment: Alignment.center,
            backgroundColor: isLightTheme?AppColor.whiteColor:AppColor.blackColor,
            elevation: 10,
            title: Text(
              title??"",
              style: AppTextStyle.lBold.copyWith(
                color:  isLightTheme?AppColor.blackColor:AppColor.whiteColor,
                fontSize: 18
              ),
            ),
            content: Text(
              subHead??"",
              style: AppTextStyle.lRegular.copyWith(
                  color:  isLightTheme?AppColor.blackColor:AppColor.whiteColor,
                  fontSize: 15
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: onClickYes,
                  child: Text(
                    "Ok",
                    style: AppTextStyle.lRegular.copyWith(
                        color:  isLightTheme?AppColor.blackColor:AppColor.whiteColor,
                        fontSize: 16
                    ),
                  ),
              ),
              ElevatedButton(
                onPressed: ()=>Get.back(),
                child: Text(
                  "Cancel",
                  style: AppTextStyle.lRegular.copyWith(
                      color:  isLightTheme?AppColor.blackColor:AppColor.whiteColor,
                      fontSize: 16
                  ),
                ),
              )
            ],

          );
        }
    );
  }
}