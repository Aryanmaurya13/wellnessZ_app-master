import 'package:dynamicutils/Size/dynamicutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/components/appBar/app_bar.dart';
import 'package:wellnessz_app/utils/tools/design_configuration/design_configuration.dart';
import 'package:wellnessz_app/view_models/controllers/user_type_controller/user_type_controller.dart';
import '../../../resources/styles/text_styles/text_styles.dart';


class CoachThemeView extends StatefulWidget {
  const CoachThemeView({super.key});

  @override
  State<CoachThemeView> createState() => _CoachThemeViewState();
}

class _CoachThemeViewState extends State<CoachThemeView> {
  UserTypeController themController = Get.put(UserTypeController());
  final DynamicSize _size = DynamicSize(812, 375);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          context: context,
          isLightThem: themController.isLightTheme,
          isColorChange: true,
          title: 'Theme'),
      body: Container(
        color: themController.isLightTheme.value
            ? AppColor.whiteColor
            : AppColor.blackColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _size.heightSpace(10),
              Container(
                height: _size.height(83),
                width: _size.width(342),
                decoration: BoxDecoration(
                  color: themController.isLightTheme.value
                      ? AppColor.lightGrey
                      : AppColor.pureBlackColor,
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: [
                    accountSettingType( 'Dark'),
                    accountSettingType( 'Light'),

                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }

  Widget heading(String heading) {
    return Text(
      heading,
      style: AppTextStyle.pSemiBold.copyWith(
          fontSize: 15,
          color: themController.isLightTheme.value
              ? AppColor.blackColor
              : AppColor.whiteColor),
    );
  }

  Widget accountSettingType( String settingType) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 40),
          child: Center(child: heading(settingType))
        ),

      ],
    );
  }
}
