 import 'package:dynamicutils/Size/dynamicutils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../resources/colors/app_colors.dart';
import '../../../resources/styles/text_styles/text_styles.dart';
import '../../../utils/tools/design_configuration/design_configuration.dart';

DynamicSize size = DynamicSize(812, 375);

Widget signInWithGoogleButton(Function() onSubmit,Color color){
  return Align(
    alignment: Alignment.center,
    child: CupertinoButton(
      child: Container(
        // width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: size.width(20)),
        padding: EdgeInsets.symmetric(horizontal: size.width(30),vertical: size.height(20)),
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColor.textFieldTextColour,width: 1)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              DesignConfiguration.setSvgPath('google'),
            ),
            const SizedBox(width: 15,),
            Text(
              'Sign in with Google',
              textAlign: TextAlign.center,
              style: AppTextStyle.lMedium.copyWith(fontSize: 16,color: AppColor.textFieldTextColour),
            ),
          ],
        ),
      ),
      onPressed: () {
        onSubmit();
      },
    ),
  );


}


Widget hiiThereTextWidgets(){
  final DynamicSize _size = DynamicSize(812, 375);
  return  Padding(
    padding: EdgeInsets.only(left: _size.width(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'hii_there'.tr,
          style: AppTextStyle.pBold.copyWith(
            fontSize: 20,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          'lets_start'.tr,
          style: AppTextStyle.pMedium
              .copyWith(fontSize: 15, color: AppColor.darkGrey),
          textAlign: TextAlign.start,
        ),
      ],
    ),
  );
}

Widget seperatorWidgets(bool isLightMode){
  return Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(height: 1, color: AppColor.whiteColor,width: size.width(70)),
      const Text(
        'or continue with',
        style: AppTextStyle.lMedium,
      ),
      Container(height: 1, color: AppColor.whiteColor,width: size.width(70)),
    ],
  );
}