import 'package:flutter/material.dart';
import '../../../resources/colors/app_colors.dart';
import '../../../resources/styles/text_styles/text_styles.dart';

class CustomSnackBar{
  static warningSnackBar({@required BuildContext? context, String? message}){
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 5),
      duration: const Duration(seconds: 2),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.warning_amber,color: AppColor.whiteColor,),
                  const SizedBox(width:8.24 ,),
                  Text(
                    "Warning",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.pRegular
                        .copyWith(color: AppColor.whiteColor, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(onPressed: (){ScaffoldMessenger.of(context!).hideCurrentSnackBar();}, icon: const Icon(Icons.close,color: AppColor.whiteColor,))
            ],
          ),
          if(message!=null)
            Text(
              message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.pRegular
                  .copyWith(color: AppColor.whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          if(message!=null)
            const SizedBox(height: 10,)
        ],
      ),
      backgroundColor: AppColor.yellowColor,
    );
    return ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }

  static errorSnackBar({@required BuildContext? context, String? message}){
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 5),
      duration: const Duration(seconds: 2),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.error_outline_outlined,color: AppColor.whiteColor,),
                  const SizedBox(width:8.24 ,),
                  Text(
                    "Something Went Wrong",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.pRegular
                        .copyWith(color: AppColor.whiteColor, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(onPressed: (){ScaffoldMessenger.of(context!).hideCurrentSnackBar();}, icon: const Icon(Icons.close,color: AppColor.whiteColor,))
            ],
          ),
          if(message!=null)
            Text(
              message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.pRegular
                  .copyWith(color: AppColor.whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          if(message!=null)
            const SizedBox(height: 10,)
        ],
      ),
      backgroundColor: AppColor.redColor,
    );
    return ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }

  static successSnackBar({@required BuildContext? context, String? message}){
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 5),
      duration: const Duration(seconds: 2),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.check_circle,color: AppColor.whiteColor,),
                  const SizedBox(width:8.24 ,),
                  Text(
                    "Success",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.pRegular
                        .copyWith(color: AppColor.whiteColor, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(onPressed: (){ScaffoldMessenger.of(context!).hideCurrentSnackBar();}, icon: const Icon(Icons.close,color: AppColor.whiteColor,))
            ],
          ),
          if(message!=null)
            Text(
              message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.pRegular
                  .copyWith(color: AppColor.whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          if(message!=null)
            const SizedBox(height: 10,)
        ],
      ),
      backgroundColor: AppColor.darkGreen,
    );
    return ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }

  static customSnackBar({@required BuildContext? context, String? message, @required String? title, @required Color? color , @required Icon? icon}){
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 5),
      duration: const Duration(seconds: 2),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon??const Icon(Icons.done,color: AppColor.whiteColor,),
                  const SizedBox(width:8.24 ,),
                  Text(
                    title??"",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.pRegular
                        .copyWith(color: AppColor.whiteColor, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(onPressed: (){ScaffoldMessenger.of(context!).hideCurrentSnackBar();}, icon: const Icon(Icons.close,color: AppColor.whiteColor,))
            ],
          ),
          if(message!=null)
            Text(
              message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.pRegular
                  .copyWith(color: AppColor.whiteColor, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          if(message!=null)
            const SizedBox(height: 10,)
        ],
      ),
      backgroundColor: color??Colors.transparent,
    );
    return ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }




}


