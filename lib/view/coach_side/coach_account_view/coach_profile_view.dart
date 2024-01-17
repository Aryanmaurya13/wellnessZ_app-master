import 'package:dynamicutils/Size/dynamicutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/components/appBar/app_bar.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';
import 'package:wellnessz_app/utils/tools/design_configuration/design_configuration.dart';
import 'package:wellnessz_app/view_models/controllers/user_type_controller/user_type_controller.dart';

import '../../../resources/routes/route_names.dart';


class CoachProfileView extends StatefulWidget {
  const CoachProfileView({super.key});

  @override
  State<CoachProfileView> createState() => _CoachProfileViewState();
}

class _CoachProfileViewState extends State<CoachProfileView> {
  UserTypeController themController = Get.put(UserTypeController());
  final DynamicSize _size = DynamicSize(812, 375);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          context: context,
          title: 'Profile',
          isLightThem: themController.isLightTheme,
          isColorChange: true,
          actions: [
            editPrfile(
                  () {
                Get.toNamed(RouteName.clientAccountView);
              },
            )
          ]),
      body: Container(
        color: themController.isLightTheme.value
            ? AppColor.whiteColor
            : AppColor.blackColor,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _size.heightSpace(30),
            CircleAvatar(
              radius: 75,
              backgroundImage:
              AssetImage(DesignConfiguration.setPngPath('coach_image')),
            ),
            _size.heightSpace(15),
            Text(
              'John Doe',
              style: AppTextStyle.lRegular.copyWith(
                  fontSize: 20,
                  color: themController.isLightTheme.value
                      ? AppColor.blackColor
                      : AppColor.whiteColor.withOpacity(0.25)),
            ),
            Text('ID #1234',
                style: AppTextStyle.lMedium.copyWith(
                    fontSize: 10,
                    color: themController.isLightTheme.value
                        ? AppColor.blackColor
                        : AppColor.whiteColor.withOpacity(0.25))),
            _size.heightSpace(30),
            Center(
              child: Container(
                height: _size.height(263),
                width: _size.width(342),
                decoration: BoxDecoration(
                  color: themController.isLightTheme.value
                      ? AppColor.lightGrey
                      : AppColor.pureBlackColor,
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Information',
                        style: AppTextStyle.pSemiBold.copyWith(
                            fontSize: 16,
                            color: themController.isLightTheme.value
                                ? AppColor.blackColor
                                : AppColor.whiteColor),
                      ),
                      Divider(
                        color: themController.isLightTheme.value
                            ? AppColor.blackColor
                            : AppColor.whiteColor.withOpacity(0.25),
                        thickness: 1,
                      ),
                      _size.heightSpace(10),
                      personalInformationData('Mobile', '+91 9876543210', 25.0),
                      _size.heightSpace(10),
                      personalInformationData(
                          'Email ID', 'johndoe@wellnessz.com', 20.0),
                      _size.heightSpace(10),
                      personalInformationData(
                          'Height', '5 feet 8 Inches', 30.0),
                      _size.heightSpace(10),
                      personalInformationData('Weight', '60 Kg', 27.0),
                      _size.heightSpace(10),
                      personalInformationData('Address',
                          '123 New Street, Park Avenue\nBrampton', 20.0),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget personalInformationData(String typeOfDate, String data, var padding) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          typeOfDate,
          style: AppTextStyle.lSemiBold.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: themController.isLightTheme.value
                  ? AppColor.blackColor
                  : AppColor.darkGrey),
        ),
        Padding(
          padding: EdgeInsets.only(left: padding),
          child: Text(
            data,
            style: AppTextStyle.lMedium.copyWith(
                fontSize: 15,
                color: themController.isLightTheme.value
                    ? AppColor.blackColor
                    : AppColor.whiteColor.withOpacity(0.50)),
          ),
        )
      ],
    );
  }

  Widget editPrfile(Function() onTap) {
    return GestureDetector(
        onTap: onTap,
        child:
        SvgPicture.asset(DesignConfiguration.setSvgPath('edit_profile')));
  }
}
