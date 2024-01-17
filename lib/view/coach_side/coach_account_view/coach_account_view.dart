import 'package:dynamicutils/Size/dynamicutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/components/appBar/app_bar.dart';
import 'package:wellnessz_app/utils/tools/design_configuration/design_configuration.dart';
import 'package:wellnessz_app/view_models/controllers/user_type_controller/user_type_controller.dart';
import '../../../resources/styles/text_styles/text_styles.dart';


class CoachAccountView extends StatefulWidget {
  const CoachAccountView({super.key});

  @override
  State<CoachAccountView> createState() => _CoachAccountViewState();
}

class _CoachAccountViewState extends State<CoachAccountView> {
  UserTypeController themController = Get.put(UserTypeController());
  final DynamicSize _size = DynamicSize(812, 375);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          context: context,
          isLightThem: themController.isLightTheme,
          isColorChange: true,
          title: 'Account'),
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
              heading('Account'),
              _size.heightSpace(5),
              Container(
                height: _size.height(132),
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
                    accountSettingType('profile', 'Profile'),
                    accountSettingType('setting_icon', 'Settings'),
                    accountSettingType('theam', 'Theme')
                  ],
                ),
              ),
              _size.heightSpace(20),
              heading('Support & About'),
              _size.heightSpace(5),
              Container(
                height: _size.height(132),
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
                    accountSettingType('invite_icon', 'Invite Friends'),
                    accountSettingType('help_icon', 'Help & Support'),
                    accountSettingType('terms_icon', 'Terms and Policies')
                  ],
                ),
              ),
              _size.heightSpace(20),
              heading('Actions'),
              _size.heightSpace(5),
              Container(
                height: _size.height(98),
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
                    accountSettingType('feedback_icon', 'Feedback'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, right: 40),
                          child: SvgPicture.asset(
                            DesignConfiguration.setSvgPath('logout_icon'),
                            color: AppColor.redColor,
                          ),
                        ),
                        Center(
                            child: Text(
                              'Log out',
                              style: AppTextStyle.pSemiBold
                                  .copyWith(fontSize: 16, color: AppColor.redColor),
                            ))
                      ],
                    )
                  ],
                ),
              )
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
          fontSize: 16,
          color: themController.isLightTheme.value
              ? AppColor.blackColor
              : AppColor.whiteColor),
    );
  }

  Widget accountSettingType(String icon, String settingType) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 40),
          child: SvgPicture.asset(
            DesignConfiguration.setSvgPath(icon),
            height: _size.height(30),
            width: _size.width(30),
            color: themController.isLightTheme.value
                ? AppColor.iconColorLight
                : AppColor.whiteColor.withOpacity(0.5),
          ),
        ),
        Center(child: heading(settingType))
      ],
    );
  }
}
