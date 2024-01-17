import 'package:dynamicutils/Size/dynamicutils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/utils/tools/design_configuration/design_configuration.dart';
import 'package:wellnessz_app/view/login_views/widgets/all_widgets.dart';
import 'package:wellnessz_app/view/login_views/widgets/otp_text_field.dart';
import 'package:wellnessz_app/view/login_views/widgets/verify_otp_button.dart';
import 'package:wellnessz_app/view_models/controllers/login_controller/verify_otp_controller.dart';
import '../../resources/styles/text_styles/text_styles.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final DynamicSize _size = DynamicSize(812, 375);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyOtpController>(
      init: VerifyOtpController(),
        builder: (controller){
      return Scaffold(
        extendBody: true,
        backgroundColor: controller.isLightTheme.value
            ? AppColor.whiteColor
            : AppColor.blackColor,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          reverse: true,
          child: Column(
            children: [
              _size.heightSpace(30),
              Image.asset(
                DesignConfiguration.setPngPath('otpverification'),
                height: _size.height(335),
                width: _size.width(350),
              ),
              _size.heightSpace(30),
              otpText(controller.isLightTheme),
              _size.heightSpace(10),
              enterOtpText(controller.mobileNumber,
                  controller.isLightTheme),
              _size.heightSpace(20),
              OtpTextField(
                  controller: controller.otpFieldController,
                  isLightTheme: controller.isLightTheme,
                  onChanged: (value)=>controller.onOtpChange(value),
                  onCompleted: (value)=>controller.onOtpComplete(value)),
              _size.heightSpace(30),

              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyle.lRegular.copyWith(
                        fontSize: 13,
                        color: controller.isLightTheme.value
                            ? AppColor.blackColor
                            : AppColor.whiteColor),
                    text: "didnt_receive_otp".tr,
                    children: <TextSpan>[
                      TextSpan(
                          text: (controller.otpTimerSeconds.value!=0)
                              ? 'Resend OTP in ( ${controller.otpTimerSeconds} ) seconds'
                              : 'Resend OTP',
                          style: AppTextStyle.lBold.copyWith(
                              fontSize: 13,
                              color:
                              controller.isLightTheme.value
                                  ? AppColor.blackColor
                                  : AppColor.whiteColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              if(controller.otpTimerSeconds.value<=0){
                                controller.startResendTimer();
                                controller.resendOtpButton();
                              }
                            }),
                    ],
                  ),
                ),
              ),
              //resendOtpWidget(startResendTimer),
              _size.heightSpace(45),
              VerifyOtpButton(onTap: controller.verifyOtpButton, otpLength: controller.otpLength,size: _size),
              _size.heightSpace(20),
            ],
          ),
        ),
      );
    });
  }
}
