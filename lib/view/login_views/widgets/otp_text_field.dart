import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';
import 'package:get/get.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({super.key, required this.controller, required this.isLightTheme, required this.onChanged, required this.onCompleted});

  final OtpFieldController controller;
  final RxBool isLightTheme;
  final Function(String?) onChanged;
  final Function(String?) onCompleted;

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      length: 4,
      controller: controller,
      fieldWidth: MediaQuery.sizeOf(context).width * 0.12,
      width: MediaQuery.sizeOf(context).width,
      textFieldAlignment: MainAxisAlignment.spaceEvenly,
      fieldStyle: FieldStyle.underline,
      outlineBorderRadius: 10,
      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
      otpFieldStyle: OtpFieldStyle(
          borderColor: AppColor.lightGreen,
          enabledBorderColor: AppColor.lightGreen),
      keyboardType: TextInputType.number,
      style: AppTextStyle.lRegular.copyWith(fontSize: 20,color: isLightTheme.value ? AppColor.blackColor :AppColor.whiteColor ),
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}
