import 'package:dynamicutils/dynamic_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';

class VerifyOtpButton extends StatelessWidget {
  const VerifyOtpButton({super.key, required this.onTap, required this.otpLength, required this.size});

  final VoidCallback onTap;
  final RxInt otpLength;
  final DynamicSize size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width(115),vertical: size.height(15)),
        decoration:  BoxDecoration(
          color: otpLength.value == 4 ? AppColor.lightGreen :AppColor.charcoalGrey,
          borderRadius: const BorderRadius.all(Radius.circular(32)),
        ),
        child: Text('Verify',style: AppTextStyle.lBold.copyWith(fontSize: 16)),
      ),
    );
  }
}
