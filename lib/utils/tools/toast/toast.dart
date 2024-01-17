import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../resources/colors/app_colors.dart';

class Toast {
  static normalToast({@required String? message}){
    Fluttertoast.showToast(
        msg: message??"",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Get.isDarkMode? AppColor.whiteColor:AppColor.blackColor,
        textColor: Get.isDarkMode? AppColor.blackColor:AppColor.whiteColor,
        fontSize: 16.0
    );
  }
}