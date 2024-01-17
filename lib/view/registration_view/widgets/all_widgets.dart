
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../resources/colors/app_colors.dart';
import '../../../resources/styles/text_styles/text_styles.dart';
import '../../../utils/tools/design_configuration/design_configuration.dart';

Widget lightModeImage(BuildContext context, RxBool isLightThem) {
  return Lottie.asset(
      isLightThem.value
          ? DesignConfiguration.setLottiePath('light_registration')
          : DesignConfiguration.setLottiePath('dark_registration'),
      height: MediaQuery.of(context).size.height * 0.45,
    width: MediaQuery.of(context).size.width,
  );
}

Widget hiiThereJourneyText(RxBool isLightThem, String subHead) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'hi_reg'.tr,
        style: AppTextStyle.pBold.copyWith(
            fontSize: 20,
            color: isLightThem.value
                ? AppColor.charcoalGrey
                : AppColor.whiteColor),
        textAlign: TextAlign.start,
      ),
      Text(
        subHead,
        style: AppTextStyle.pMedium.copyWith(
            fontSize: 15,
            color:
                isLightThem.value ? AppColor.blackColor : AppColor.darkGrey),
        textAlign: TextAlign.start,
      )
    ],
  );
}



