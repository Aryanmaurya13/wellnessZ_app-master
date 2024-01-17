import 'package:dynamicutils/dynamic_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../resources/styles/text_styles/text_styles.dart';

Widget welcomeText(DynamicSize size){
  return Padding(
    padding: EdgeInsets.only(left:size.width(26)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'welcome_to_wel'.tr,
          style: AppTextStyle.pBold.copyWith(fontSize: 24),
          textAlign: TextAlign.start,
        ),
        size.heightSpace(7),
        Text(
          'please_choose_your_account'.tr,
          style: AppTextStyle.pMedium.copyWith(fontSize: 12),
          textAlign: TextAlign.start,
        ),
      ],
    ),
  );
}