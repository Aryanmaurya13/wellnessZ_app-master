import 'package:flutter/material.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({super.key, required this.isLightTheme, required this.listToShow, this.suffix, this.onSelected, this.horizontalPadding, required this.selectedItem, this.border});
  final bool isLightTheme;
  final List listToShow;
  final String? suffix;
  final Function(dynamic)? onSelected;
  final double? horizontalPadding;
  final Border? border;
  final RxString selectedItem;

  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton(
        color: isLightTheme?AppColor.whiteColor:AppColor.blackColor,
        itemBuilder: (BuildContext context) {
          return listToShow
              .map<PopupMenuItem>((value) => PopupMenuItem(
              value: value,
              child: SizedBox(
                  child: Text("$value ${suffix??""}",style: AppTextStyle.lBold.copyWith(fontSize: 16,color: isLightTheme?AppColor.blackColor:AppColor.whiteColor,),)
              )
          )).toList();
        },
        onSelected: onSelected,
        child:Container(
          padding:  const EdgeInsets.symmetric(horizontal: 30,vertical: 13),
          decoration: BoxDecoration(
            color:  isLightTheme
                ? AppColor.buttonColorLight
                : AppColor.buttonColorDark,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
            border: border,
           ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Flexible(child:  Obx(() => Text(
               selectedItem.value,style: AppTextStyle.lMedium.copyWith(
               fontSize: 17,
               fontWeight: FontWeight.w500,
               color: isLightTheme?AppColor.blackColor:AppColor.whiteColor,
             ),)
             ),),
              SizedBox(width: horizontalPadding,),
              Icon(Icons.arrow_drop_down_sharp,color: isLightTheme?AppColor.blackColor:AppColor.whiteColor,)
            ],
          )
        ),
    );
  }
}
