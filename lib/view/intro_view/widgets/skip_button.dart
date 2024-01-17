import 'package:flutter/material.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.onTap
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
        decoration: BoxDecoration(
          color: AppColor.whiteColor.withOpacity(0.35),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Text("Skip",style: AppTextStyle.pMedium.copyWith(fontSize: 12),),
      ),
    );
  }
}
