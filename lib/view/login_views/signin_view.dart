import 'package:dynamicutils/Size/dynamicutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/components/buttons/small_button.dart';
import 'package:wellnessz_app/resources/components/textFields/text_field.dart';
import 'package:wellnessz_app/view/login_views/widgets/sigin_widgets.dart';
import '../../resources/colors/app_colors.dart';
import '../../resources/styles/text_styles/text_styles.dart';
import '../../utils/tools/design_configuration/design_configuration.dart';
import '../../utils/tools/validator/validation.dart';
import '../../view_models/controllers/login_controller/signin_controller.dart';


class SigInView extends StatefulWidget {

  const SigInView({super.key});

  @override
  State<SigInView> createState() => _SigInViewState();
}

class _SigInViewState extends State<SigInView> {
  final DynamicSize _size = DynamicSize(812, 375);
  SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: !controller.isCoach,
      body: Obx(()=>Hero(
        tag: "back_img",
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(controller.isLightTheme.value
                    ? DesignConfiguration.setPngPath('user_type_light')
                    : DesignConfiguration.setJpgPath('user_type_dark')),
                fit: controller.isLightTheme.value
                    ? BoxFit.fill
                    : BoxFit.cover),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
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
              Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hiiThereTextWidgets(),
                    _size.heightSpace(30),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: _size.width(25)),
                      child: CustomTextField(
                        node: controller.inputNode,
                        controller: controller.inputController,
                        hintSize: 15,
                          isLightMode: controller.isLightTheme.value,
                          textInputType: controller.isCoach
                              ? TextInputType.number
                              : TextInputType.text,
                          hintText: controller.isCoach
                              ? 'enter_phone_number'.tr
                              :'enter_coach_id'.tr ,
                          validator: (val){
                          if(controller.isCoach){
                            return StringValidator.validateMob(
                                val,
                                'Mobile Number is Required',
                                'Invalid Number');
                          }else{
                            return StringValidator.validateCoachId(
                                val,
                                'Coach ID is Required',
                                'Coach ID is invalid');
                          }
                          }
                      ),
                    ),

                    _size.heightSpace(13),
                    Center(
                        child: SmallButton(
                          horizontalPadding: _size.width(79.91),
                          text: 'Sign In',
                          onTap: controller.onSignIn,
                          textStyle:
                          AppTextStyle.lBold.copyWith(fontSize: 20),
                        )
                    ),

                    _size.heightSpace(13),

                    if(controller.isCoach)
                    seperatorWidgets(controller.isLightTheme.value),

                    _size.heightSpace(15),

                    if(controller.isCoach)
                      signInWithGoogleButton(
                            controller.onGoogleSignIn,
                        controller.isLightTheme.value
                            ? AppColor.whiteColor
                            : AppColor.buttonColorDark),

                    _size.heightSpace(30),

                  ],
                ),
              )
            ],
          ),
        ),
      )
      )
    );
  }
}
