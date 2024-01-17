
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';


Widget enterOtpText(String mobileNumber,RxBool isLightThem) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Enter OTP sent to ',
        style: AppTextStyle.lRegular
            .copyWith(fontSize: 13, color: isLightThem.value ? AppColor.charcoalGrey : AppColor.whiteColor),
      ),
      Text(
        '+91$mobileNumber',
        style: AppTextStyle.lBold
            .copyWith(fontSize: 14, color: isLightThem.value ? AppColor.blackColor : AppColor.whiteColor),
      )
    ],
  );
}

Widget otpText(RxBool isLightThem) {
  return Text(
    'otp_verify_text'.tr,
    style:
        AppTextStyle.lBold.copyWith(fontSize: 22, color: isLightThem.value ? AppColor.blackColor : AppColor.whiteColor),
  );
}






