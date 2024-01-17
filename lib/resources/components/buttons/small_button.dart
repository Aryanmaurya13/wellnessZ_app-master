import 'package:flutter/material.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key, required this.onTap, required this.text, required this.textStyle, this.horizontalPadding,
  });

  final VoidCallback onTap;
  final String text;
  final TextStyle textStyle;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding??50,vertical: 16),
        decoration: const BoxDecoration(
          color: AppColor.lightGreen,
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        child: Text(text,style: textStyle),
      ),
    );
  }
}