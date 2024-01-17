import 'package:dynamicutils/dynamic_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/components/dropDownButtons/custom_drop_down_button.dart';
import 'package:wellnessz_app/resources/components/textFields/text_field.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';
import 'package:wellnessz_app/view/registration_view/widgets/all_widgets.dart';
import 'package:wellnessz_app/view_models/controllers/login_controller/registration_controller.dart';
import '../../resources/components/buttons/small_button.dart';


class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final DynamicSize _size = DynamicSize(812, 375);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      init: RegistrationController(),
        builder: (controller){
          return PopScope(
            canPop: false,
            onPopInvoked:(val)=> controller.onBack(val),
            child: Scaffold(
              backgroundColor: controller.isLightTheme.value
                  ? AppColor.whiteColor
                  : AppColor.blackColor,
              body: Form(
                key: controller.formKey,
                child: PageView.builder(
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      reverse: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _size.heightSpace(30),
                          lightModeImage(context, controller.isLightTheme),
                          _size.heightSpace(50),
                          hiiThereJourneyText(controller.isLightTheme,controller.subHead(index)),
                          _size.heightSpace(20),

                          if(index!=2 &&index!=3)
                          CustomTextField(
                              borderSide: const BorderSide(color: AppColor.transparentColor),
                              controller: controller.commonController(index),
                              hintSize: 15,
                              isLightMode: controller.isLightTheme.value,
                              textInputType: controller.inputType(controller.commonController(index)),
                              hintText: controller.hintText(index) ,
                              validator: (val){
                                return controller.validation(index);
                              }
                          ),

                          if(index==2)
                          CustomDropDownButton(
                            horizontalPadding: 0,
                              onSelected: controller.selectNumberOfClients,
                              isLightTheme: controller.isLightTheme.value,
                            listToShow: controller.numberOfClientsList,
                            selectedItem: controller.totalNumberOfClients,
                          ),

                          if(index==3)
                            CustomDropDownButton(
                              horizontalPadding: 0,
                              onSelected: controller.selectOrganisations,
                              isLightTheme: controller.isLightTheme.value,
                              listToShow: controller.organisationsList,
                              selectedItem: controller.selectedOrganisations,
                            ),

                          _size.heightSpace(20),

                          Center(
                            child: SmallButton(
                                horizontalPadding: _size.width(80),
                                onTap: ()=>controller.onContinue(index),
                                text: 'Continue',
                                textStyle: AppTextStyle.lBold.copyWith(fontSize: 20)
                            ),
                          ),
                          _size.heightSpace(60),
                        ],
                      ).marginSymmetric(horizontal: _size.width(20)),
                    );
                  },
                ),
              ),
            ),
          );
        }
    );
  }
}

