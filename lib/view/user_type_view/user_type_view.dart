import 'package:dynamicutils/dynamic_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/components/buttons/small_button.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';
import 'package:wellnessz_app/utils/tools/design_configuration/design_configuration.dart';
import 'package:wellnessz_app/view/user_type_view/widgets/app_button.dart';
import 'package:wellnessz_app/view/user_type_view/widgets/common_widgets.dart';
import 'package:wellnessz_app/view_models/controllers/user_type_controller/user_type_controller.dart';


class UserTypeView extends StatefulWidget {
  const UserTypeView({super.key});

  @override
  State<UserTypeView> createState() => _UserTypeViewState();
}

class _UserTypeViewState extends State<UserTypeView> {
  final DynamicSize _size = DynamicSize(812, 375);
  UserTypeController controller = Get.put(UserTypeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Obx(()=>Hero(
        tag: "back_img",
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    controller.isLightTheme.value?
                    DesignConfiguration.setPngPath('user_type_light')
                        :DesignConfiguration.setJpgPath('user_type_dark')
                ),
                fit: controller.isLightTheme.value?BoxFit.fill:BoxFit.cover
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColor.pureBlackColor.withOpacity(0.4),
                          AppColor.pureBlackColor.withOpacity(0.95)
                        ])),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  welcomeText(_size),
                  Column(
                    children: [
                      LargeButton(
                        title: 'I am a Coach',
                        onSubmit: () {
                          controller.isCoach.value = true;
                          if(controller.isClient.value){
                            controller.isClient.value = false;
                          }
                        },
                        svgLogo: 'coach',
                        isSelected: controller.isCoach.value, isLightTheme: controller.isLightTheme.value,
                      ),
                      Center(
                          heightFactor: 0.5,
                          child: LargeButton(
                            title: 'I am a Client',
                            onSubmit: () {
                              controller.isClient.value = true;
                              if(controller.isCoach.value){
                                controller.isCoach.value = false;
                              }
                            },
                            svgLogo: 'client',
                            isSelected: controller.isClient.value, isLightTheme: controller.isLightTheme.value,
                          )),
                      _size.heightSpace(60),
                      controller.isClient.value || controller.isCoach.value
                          ? SmallButton(
                        onTap: controller.continueOnTap,
                        text: 'Continue',
                        textStyle: AppTextStyle.lBold.copyWith(fontSize: 16),
                      )
                          : const SizedBox(),
                      _size.heightSpace(40),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
