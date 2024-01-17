import 'package:dynamicutils/Size/dynamicutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';
import 'package:wellnessz_app/view_models/controllers/user_type_controller/user_type_controller.dart';


class StarRating extends StatelessWidget {
  String totalRating, noOfReviews;
  double width,starSize,reviewSize;



  StarRating({
    Key? key,
    required this.totalRating,
    required this.width,
    required this.starSize,
    required this.reviewSize,
    required this.noOfReviews,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserTypeController controller = Get.put(UserTypeController());
    final DynamicSize _size = DynamicSize(812, 375);
    return SizedBox(
      width: _size.width(width),
      child: Row(
        children: [
          Container(
            width: _size.width(starSize),
            height:_size.width(starSize),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0, 0),
                end: Alignment(1, 1),
                colors: [
                   AppColor.transparentColor,
                  AppColor.transparentColor,
                ],
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: const FittedBox(
              child: Icon(
                Icons.star,
                color: AppColor.yellowColor,
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            '($noOfReviews Reviews)',
            style: AppTextStyle.pRegular.copyWith(
                fontSize: reviewSize,
                color: controller.isLightTheme.value
                    ? AppColor.blackColor
                    : AppColor.whiteColor),
          )
        ],
      ),
    );
  }
}
