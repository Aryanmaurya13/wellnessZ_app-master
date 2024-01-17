
import 'package:dynamicutils/dynamic_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';
import 'package:wellnessz_app/utils/tools/design_configuration/design_configuration.dart';
import '../../../resources/colors/app_colors.dart';

// class SmallButton extends StatelessWidget {
//   String title;
//   double fontSize;
//   Function() onSubmit;
//
//   SmallButton({super.key, required this.onSubmit, required this.title,required this.fontSize});
//
//   @override
//   Widget build(BuildContext context) {
//     final DynamicSize _size = DynamicSize(812, 375);
//     return CupertinoButton(
//       child: Container(
//         width: _size.width(184),
//         height: _size.height(56),
//         alignment: FractionalOffset.center,
//         decoration: BoxDecoration(
//             color: AppColor.lightGreen,
//             borderRadius: BorderRadius.circular(50)),
//         child: Text(
//           title,
//           style: AppTextStyle.lMedium.copyWith(fontSize: fontSize),
//         ),
//       ),
//       onPressed: () {
//         onSubmit();
//       },
//     );
//   }
// }
DynamicSize size = DynamicSize(812, 375);
class LargeButton extends StatelessWidget {
  String title;
  Function() onSubmit;
  String svgLogo;
  bool isSelected;
  bool isLightTheme;

  LargeButton(
      {
      super.key,
      required this.title,
      required this.onSubmit,
      required this.isSelected,
      required this.svgLogo,
      required this.isLightTheme,
      });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        width: size.width(275),
        height: size.height(56),
        // margin: EdgeInsets.symmetric(horizontal: size.width(45)),
        // padding: EdgeInsets.symmetric(vertical: size.height(10)),
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
          border: isLightTheme? (isSelected? null:Border.all(color: AppColor.whiteColor)) :(isSelected? null:Border.all(color: AppColor.whiteColor)),
            color: isLightTheme?(isSelected ?AppColor.lightGreen : AppColor.whiteColor):(isSelected?AppColor.lightGreen:AppColor.transparentColor),
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.only(left:10,right:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset(DesignConfiguration.setPngPath(svgLogo),
             color: isLightTheme?isSelected ? AppColor.whiteColor : AppColor.blackColor:AppColor.whiteColor,
             height: size.height(40),
             width: size.width(40),
             ),
              const SizedBox(width: 10,),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.lMedium.copyWith(fontSize: 16,color: isLightTheme?isSelected ? AppColor.whiteColor : AppColor.blackColor:AppColor.whiteColor ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        onSubmit();
      },
    );
  }
}

