import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';

import '../../colors/app_colors.dart';
import '../../../utils/tools/design_configuration/design_configuration.dart';

AppBar getAppBar(
    {required BuildContext context,
      required RxBool isLightThem,
      required bool isColorChange,
      required String title,
      List<Widget>? actions,
      }) {
  return AppBar(
    leading:  GestureDetector(
      onTap: () {
            Navigator.pop(context);
          },
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
          height: 10,
          width: 10,
          child: SvgPicture.asset(DesignConfiguration.setSvgPath('back_icon'),
              height: 10,
              width: 20,
          ),
        ),
      ),
    ),
    automaticallyImplyLeading: true,
    elevation: 0,
    title: Text(title,style: AppTextStyle.pRegular.copyWith(fontSize: 20),),
    centerTitle: true,
    backgroundColor: isLightThem.value  ? AppColor.lightGreen : isColorChange ? AppColor.pureBlackColor : AppColor.lightGreen,
    actions: actions ?? [],
  );
}
