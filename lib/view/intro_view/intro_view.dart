import 'package:dots_indicator/dots_indicator.dart';
import 'package:dynamicutils/dynamic_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/components/buttons/small_button.dart';
import 'package:wellnessz_app/resources/components/switch/theme_switch.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/utils/tools/debug_tools/debug_tools.dart';
import 'package:wellnessz_app/view/intro_view/widgets/build_full_screen_image.dart';
import 'package:wellnessz_app/view/intro_view/widgets/decorations.dart';
import 'package:wellnessz_app/view/intro_view/widgets/skip_button.dart';
import 'package:wellnessz_app/view/intro_view/widgets/translucent_sheet.dart';
import 'package:wellnessz_app/view_models/services/intro_services/intro_services.dart';

IntroServices services = IntroServices();

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {


  @override
  void initState() {
    services.getThemeStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: services.introKey,
      globalBackgroundColor: AppColor.backgroundColor,
      allowImplicitScrolling: true,
      autoScrollDuration: 5000,
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => services.isThirdPage.value?Container():
              SkipButton(onTap:()=>services.onIntroEnd(),),),
              ThemeSwitch(
                isLightTheme: services.isLightTheme,
                onChange:(val) {
                  kDebugPrint(val);
                  services.isLightTheme.value = !val;
                  Get.changeThemeMode(
                    val ? ThemeMode.dark : ThemeMode.light,
                  );
                  services.saveThemeStatus(!val);
                } ,
              )
            ],
          ).marginSymmetric(horizontal: _size.width(20),vertical: _size.height(10))
        ),
      ),
      pages: pagesList,
      onDone: (){},
      onChange: (val){
        if(val==2){
          services.isThirdPage.value = true;
        }else{
          services.isThirdPage.value= false;
        }
      },
      onSkip: (){},
      showSkipButton: false,
      showNextButton: false,
      showBackButton: false,
      showDoneButton: false,
      back: const Text(''),
      skip: const Text(''),
      next: const Text(''),
      done: const Text(''),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: AppColor.charcoalGrey,
        activeColor: AppColor.mediumGreen,
        activeSize: Size(28.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

final DynamicSize _size = DynamicSize(812, 375);
List<PageViewModel> pagesList = [
  PageViewModel(
    title: "",
    body: "",
    image: buildFullscreenImage('intro3.png'),
    footer: Stack(
      alignment: Alignment.center,
      children: [
        TranslucentSheet(isLightTheme:  services.isLightTheme,),
        Obx(() => Text(
          'intro1'.tr,
          style: AppTextStyle.pSemiBold.copyWith( color: services.isLightTheme.value?AppColor.blackColor:AppColor.whiteColor, fontSize: 30),
          textAlign: TextAlign.center,
        ),),
      ],
    ),
    decoration: pageDecoration.copyWith(
      bodyAlignment: Alignment.topCenter,
      contentMargin: EdgeInsets.symmetric(horizontal: _size.width(16)),
      fullScreen: true,
      bodyFlex: 5,
      imageFlex: 5,
      footerFlex: 6,
      safeArea: 0,
    ),
  ),

  PageViewModel(
    title: "",
    body: "",
    image: buildFullscreenImage('intro2.png'),
    footer: Stack(
      alignment: Alignment.center,
      children: [
        TranslucentSheet(isLightTheme: services.isLightTheme,),
        Obx(() => Text(
          'intro2'.tr,
          style: AppTextStyle.pSemiBold.copyWith( color: services.isLightTheme.value?AppColor.blackColor:AppColor.whiteColor, fontSize: 30),
          textAlign: TextAlign.center,
        ),),
      ],
    ),
    decoration: pageDecoration.copyWith(
      bodyAlignment: Alignment.topCenter,
      contentMargin: EdgeInsets.symmetric(horizontal: _size.width(16)),
      fullScreen: true,
      bodyFlex: 5,
      imageFlex: 5,
      footerFlex: 6,
      safeArea: 0,
    ),
  ),

  PageViewModel(
    title: "",
    body: "",
    image: buildFullscreenImage('intro1.png'),
    footer: Stack(
      alignment: Alignment.center,
      children: [
        TranslucentSheet(isLightTheme: services.isLightTheme,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              'intro3'.tr,
              style: AppTextStyle.pSemiBold.copyWith( color: services.isLightTheme.value?AppColor.blackColor:AppColor.whiteColor, fontSize: 30),
              textAlign: TextAlign.center,
            ),),
            _size.heightSpace(20),
            SmallButton(
                onTap: ()=>services.onIntroEnd(),
                text: "introButton".tr, textStyle: AppTextStyle.lSemiBold.copyWith(fontSize: 16),
            )
          ],
        ),
      ],
    ),
    decoration: pageDecoration.copyWith(
      bodyAlignment: Alignment.topCenter,
      contentMargin: EdgeInsets.symmetric(horizontal: _size.width(16)),
      fullScreen: true,
      bodyFlex: 5,
      imageFlex: 5,
      footerFlex: 6,
      safeArea: 0,
    ),
  ),
];

