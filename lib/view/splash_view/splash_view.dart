import 'package:animate_do/animate_do.dart';
import 'package:dynamicutils/Size/dynamicutils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/utils/tools/design_configuration/design_configuration.dart';
import 'package:wellnessz_app/utils/tools/snackbars/snackbar.dart';
import 'package:wellnessz_app/view_models/services/splash_services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices services = SplashServices();
  final DynamicSize _size = DynamicSize(812, 375);

  @override
  void initState() {
    services.logAppOpen();
    services.setAnalyticsProperties();
    services.navigateScreen();
    services.getThemeStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            color: AppColor.whiteColor,
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 2500),
                      from: 125,
                      child: FadeIn(
                        duration: const Duration(milliseconds: 800),
                        child: SvgPicture.asset(
                          DesignConfiguration.setSvgPath('wz_head'),
                          height: _size.height(45),
                          width: _size.width(60),
                        ),
                      ),
                    ),

                    _size.widthSpace(10),

                    FadeIn(
                      delay: const Duration(milliseconds: 2700),
                      duration: const Duration(milliseconds: 500),
                      child: SvgPicture.asset(
                        DesignConfiguration.setSvgPath('wz_trail'),
                        height: _size.height(51),
                        width: _size.width(60),
                      ),
                    ),
                  ],
                )
            )
        ),
      ),
    );
  }


}

