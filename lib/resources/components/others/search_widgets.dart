import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/resources/colors/app_colors.dart';
import 'package:wellnessz_app/resources/styles/text_styles/text_styles.dart';
import 'package:wellnessz_app/utils/tools/design_configuration/design_configuration.dart';

class CustomeSearchWidgets extends StatelessWidget {
  RxBool isLightThem;
  final TextEditingController edtSearch;
  String hintText;
  Function(String value) onSubmitted;
  Function(String value) onChanged;
  Function() onFilterTap;

  CustomeSearchWidgets(
      {super.key,
        required this.isLightThem,
        required this.onChanged,
        required this.onSubmitted,
        required this.onFilterTap,
        required this.edtSearch,
        required this.hintText});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: isLightThem.value ? AppColor.whiteColor : AppColor.blackColor,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Expanded(
                child: Container(
                  decoration: DesignConfiguration.boxDecoration(
                      isLightThem.value ? AppColor.lightGrey : AppColor.blackColor,
                      30),
                  child: ListTile(
                    title: IconButton(
                        onPressed: () {},
                        icon: edtSearch.text.isEmpty
                            ? SvgPicture.asset(
                            DesignConfiguration.setSvgPath('search_icon'))
                            : const Icon(Icons.close)),
                    trailing: SizedBox(
                      width: 230,
                      child: TextField(
                          autofocus: false,
                          style: AppTextStyle.pMedium.copyWith(
                            color: AppColor.darkGrey,
                          ),
                          controller: edtSearch,
                          onSubmitted: onSubmitted,
                          onChanged: onChanged,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hintText,
                          )),
                    ),
                  ),
                )),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: onFilterTap,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColor.lightGreen,
                    shape: BoxShape.rectangle),
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: SvgPicture.asset(
                    DesignConfiguration.setSvgPath('filter_icon')),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget CustomeSearchWidget( RxBool isLightThem,
    final TextEditingController edtSearch,
    String hintText,
    Function(String value) onSubmitted,
    Function(String value) onChanged,
    Function() onFilterTap,
    BuildContext context
    ){

  return Container(
    color: isLightThem.value ? AppColor.whiteColor : AppColor.blackColor,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      children: [
        Expanded(
            child: Container(
              decoration: DesignConfiguration.boxDecoration(
                  isLightThem.value ? AppColor.lightGrey : AppColor.pureBlackColor,
                  30),
              child: ListTile(
                title: IconButton(
                    onPressed: () {},
                    icon: edtSearch.text.isEmpty
                        ? SvgPicture.asset(
                        DesignConfiguration.setSvgPath('search_icon'))
                        : const Icon(Icons.close)),
                trailing: SizedBox(
                  width: MediaQuery.of(context).size.width*0.55,
                  child: TextField(
                      autofocus: false,
                      style: AppTextStyle.pMedium.copyWith(
                        color: AppColor.darkGrey,
                      ),
                      controller: edtSearch,
                      onSubmitted: onSubmitted,
                      onChanged: onChanged,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                      )),
                ),
              ),
            )),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onFilterTap,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColor.lightGreen,
                shape: BoxShape.rectangle),
            padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: SvgPicture.asset(
              DesignConfiguration.setSvgPath('filter_icon'),
              // height: 25,
              // width: 25,
            ),
          ),
        )
      ],
    ),
  );


}
