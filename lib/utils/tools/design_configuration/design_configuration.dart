import 'package:flutter/material.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';

class DesignConfiguration{


  static setSvgPath(String name) {
    return 'assets/SVG/$name.svg';
  }

  static setLottiePath(String name) {
    return 'assets/Lottie/$name.json';
  }

  static setPngPath(String name) {
    return 'assets/PNG/$name.png';
  }

  static setJpgPath(String name) {
    return 'assets/PNG/$name.jpg';
  }


  static placeHolder(double height) {
    return AssetImage(
      DesignConfiguration.setPngPath('placeholder'),
    );
  }

  static errorWidget(double size) {
    return Image.asset(
      DesignConfiguration.setPngPath('placeholder'),
      height: size,
      width: size,
    );
  }



  static imagePlaceHolder(double size, BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Icon(
        Icons.account_circle,
        color: AppColor.backgroundColor,
        size: size,
      ),
    );
  }

  static getCacheNotworkImage({
    required String imageurlString,
    required BuildContext context,
    required BoxFit? boxFit,
    required double? heightvalue,
    required double? widthvalue,
    required double? placeHolderSize,
  }) {
    return FadeInImage.assetNetwork(
      image: imageurlString,
      placeholder: DesignConfiguration.setPngPath('placeholder'),
      width: widthvalue,
      height: heightvalue,
      fit: boxFit,
      fadeInDuration: const Duration(
        milliseconds: 150,
      ),
      fadeOutDuration: const Duration(
        milliseconds: 150,
      ),
      fadeInCurve: Curves.linear,
      fadeOutCurve: Curves.linear,
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
          child: DesignConfiguration.errorWidget(placeHolderSize ?? 50),
        );
      },
    );

  }

  static BoxDecoration boxDecoration(
      Color? color,
      double radius, {
        Color? bordercolor,
        bool isboarder = false,
        double borderwidth = 0.5,
      }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: isboarder
          ? Border.all(color: bordercolor!, width: borderwidth)
          : null,
    );
  }

}

