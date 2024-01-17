import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';

import '../../styles/text_styles/text_styles.dart';


class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;
  String? labelText;
  TextAlign? textAlign;
  double? width;
  double? height;
  int? maxLength;
  int? maxLines;
  FocusNode? node;
  int? minLines;
  Widget? prefixIcn;
  Widget? suffixIcn;
  Function(dynamic)? validator;
  Function? onChange;
  double? hintSize, labelSize;
  TextInputType textInputType;
  BorderSide? borderSide;
  bool readOnly;
  bool isLightMode;
  double? contentPadding;

  CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.isLightMode = false,
    this.width,
    this.prefixIcn,
    this.maxLength,
    this.hintSize,
    this.labelSize,
    this.maxLines,
    this.node,
    this.minLines,
    this.suffixIcn,
    this.borderSide,
    this.height,
    this.contentPadding,
    this.textAlign,
    this.validator,
    this.onChange,
    this.textInputType = TextInputType.name,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isLightMode
          ? AppColor.buttonColorLight
          : AppColor.buttonColorDark,
      borderRadius: BorderRadius.circular(30),
      child: TextFormField(
        focusNode: node,
        controller: controller,
        maxLength: maxLength,
        maxLines: maxLines,
        minLines: minLines,
        keyboardType: textInputType,
        readOnly: readOnly,
        textAlign: textAlign ?? TextAlign.left,
        cursorColor: AppColor.whiteColor,
        inputFormatters: textInputType==TextInputType.number?<TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ]:null,
        style: AppTextStyle.lSemiBold.copyWith(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: isLightMode?AppColor.blackColor:AppColor.whiteColor,
        ),
        onChanged: (value) {
          if(textInputType==TextInputType.number || textInputType==const TextInputType.numberWithOptions() || textInputType == TextInputType.phone){
            String newValue = removeDecimalAndSymbols(value);
            controller?.text = newValue;
            controller?.selection = TextSelection.fromPosition(
              TextPosition(offset: controller!.text.length),
            );
          }
          if (onChange != null) {
            onChange!(value);
          }
        },
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        decoration: InputDecoration(
          focusColor: isLightMode
              ? AppColor.buttonColorLight
              : AppColor.buttonColorDark,
          hoverColor: isLightMode
              ? AppColor.buttonColorLight
              : AppColor.buttonColorDark,
          fillColor: isLightMode
              ? AppColor.buttonColorLight
              : AppColor.buttonColorDark,
          focusedBorder: OutlineInputBorder(
              borderSide:  borderSide??BorderSide(color: isLightMode?AppColor.transparentColor:AppColor.whiteColor),
              borderRadius: BorderRadius.circular(30)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          contentPadding: EdgeInsets.symmetric(horizontal:contentPadding??30,vertical: contentPadding??15),
          labelText: labelText,
          prefixIcon: prefixIcn,
          suffixIcon: suffixIcn,
          hintText: hintText,
          hintStyle: AppTextStyle.lRegular.copyWith(
            fontSize: hintSize??12,
            color: isLightMode?AppColor.blackColor:AppColor.whiteColor,
          ),
          labelStyle: AppTextStyle.lSemiBold.copyWith(
            fontSize: labelSize??15,
            fontWeight: FontWeight.w700,
            color: isLightMode?AppColor.blackColor:AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}

String removeDecimalAndSymbols(String value) {
  return value.replaceAll(RegExp(r'[^0-9]'), '');
}
