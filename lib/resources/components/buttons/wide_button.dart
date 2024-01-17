
import 'package:flutter/material.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';

class WideButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool? isMarginAll;
  final double? doubleMargin;
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? fontSize;
  final Widget? prefix;
  final double? textSize;

  const WideButton({
    required this.text,
    required this.onPressed,
    Key? key,
    this.isMarginAll,
    this.doubleMargin,
    this.leftMargin,
    this.rightMargin,
    this.topMargin,
    this.bottomMargin,
    this.backgroundColor,

    this.textColor, this.height, this.prefix, this.fontSize, this.textSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height,
        margin: isMarginAll ?? false ? EdgeInsets.all(doubleMargin ?? 0) : EdgeInsets.only(left: leftMargin ?? 0, right: rightMargin ?? 0,top: topMargin ?? 0,bottom: bottomMargin ?? 0),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: backgroundColor??AppColor.whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: prefix==null?Center(
          child: Text(
              text,
              style: AppTextStyle.lRegular.copyWith( color: textColor??AppColor.blackColor,
                fontSize: textSize??20,
                fontWeight: FontWeight.w500,)
          ),
        ):Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefix!,
            const SizedBox(width: 10,),
            Text(
                text,
                style: AppTextStyle.lRegular.copyWith( color: textColor??AppColor.blackColor,
                  fontSize: textSize??20,
                  fontWeight: FontWeight.w500,)
            )
          ],
        ),
      ),
    );
  }
}
