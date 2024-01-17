import 'package:flutter/material.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:get/get.dart';
class TranslucentSheet extends StatelessWidget {
  const TranslucentSheet({
    super.key,
    required this.isLightTheme
  });

  final RxBool isLightTheme;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0,0.5,1.0],
          colors: [Colors.transparent,
            !isLightTheme.value
                ? AppColor.pureBlackColor.withOpacity(0.8)
                : AppColor.whiteColor.withOpacity(0.5),
            !isLightTheme.value
                ? AppColor.pureBlackColor.withOpacity(1)
                : AppColor.whiteColor.withOpacity(0.8),
          ],
        ),
      ),
    ));
  }
}
