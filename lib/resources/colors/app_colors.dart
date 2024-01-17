import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor{
  // final RxBool? isLightTheme = false.obs;
  // AppColor(){
  //   getThemeStatus();
  // }
  //
  // void getThemeStatus() async {
  //   isLightTheme?.value = await getDataFromLocalStorage(dataType: StorageKey.boolType, prefKey: StorageKey.isLightTheme);
  //   Get.changeThemeMode((isLightTheme?.value??!(Get.isDarkMode)) ? ThemeMode.light : ThemeMode.dark);
  //   if(isLightTheme==null){
  //     await setDataToLocalStorage(dataType: StorageKey.boolType, boolData: isLightTheme?.value, prefKey: StorageKey.isLightTheme);
  //   }
  // }


static Color backgroundColor = Get.isDarkMode? const Color(0xff171717) : const Color(0xffffffff);
static Color textColor = Get.isDarkMode? const Color(0xffffffff): const Color(0xff171717);
static Color textColourDarkGray = Get.isDarkMode ? const Color(0xffffffff) : const Color(0xff4d4d4d);
static Color textFieldBackgroundColour = Get.isDarkMode ? const Color(0xff080808) : const Color(0xffD6D6D6);
static Color textFieldTextColour = const Color(0xff4d4d4d);
static Color lightGreenButton = const Color(0xff385127);
static const buttonColorLight = Color(0xffD6D6D6);
static const iconColorLight = Color(0xff544c4c);
static const buttonColorDark = Color(0xff080808);
static const whiteColor = Color(0xffffffff);
static const pureBlackColor = Color(0xff000000);
static const transparentColor = Colors.transparent;
static const blackColor = Color(0xff171717);
static const lightGreen = Color(0xff67bc2a);
static const mediumGreen = Color(0xff509613);
static const darkGreen = Color(0xff03632c);
static const lightGrey = Color(0xfff5f5f5);
static const darkGrey = Color(0xffc7c7c7);
static const charcoalGrey = Color(0xff4d4d4d);
static const yellowColor = Color(0xffF9AE1C);
static const redColor = Color(0xffAA0000);

 static  ThemeData darkTheme = ThemeData(
    hintColor: whiteColor,
    brightness: Brightness.dark,
    primaryColor: lightGreen,
    fontFamily: "Lato",
    buttonTheme: const ButtonThemeData(
      buttonColor: lightGreen,
      disabledColor: whiteColor,
    ));

static ThemeData lightTheme = ThemeData(
    hintColor: blackColor,
    brightness: Brightness.light,
    primaryColor: darkGreen,
    fontFamily: "Lato",
    buttonTheme: const ButtonThemeData(
      buttonColor: darkGreen,
      disabledColor: blackColor,
    ));
}

