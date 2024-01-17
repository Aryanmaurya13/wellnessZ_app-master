import 'package:flutter/material.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:get/get.dart';
class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
    required this.isLightTheme, this.onChange
  });

  final RxBool isLightTheme;
final Function(bool)? onChange;
  @override
  Widget build(BuildContext context) {
    return    ObxValue(
          (data) => Switch(
        value: !isLightTheme.value,
        activeColor: AppColor.blackColor.withOpacity(0.25),
        inactiveThumbColor: AppColor.whiteColor,
        thumbColor: MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected)?AppColor.blackColor:AppColor.whiteColor),
        inactiveTrackColor: AppColor.whiteColor.withOpacity(0.25),
        activeTrackColor: AppColor.blackColor.withOpacity(0.25),
        onChanged: onChange
      ),
      false.obs,
    );
  }
}
