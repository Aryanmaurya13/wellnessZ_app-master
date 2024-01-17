
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showLoadingDialog() {
  Future.delayed(const Duration(milliseconds: 0), () {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: Material(
              // color: AppColors.transparentColor,
              child: Container(
                height: 140,
                width: 140,
                padding: const EdgeInsets.all(8),
                child: const Center(child: CircularProgressIndicator(),),
              ),
            ),
          );
        });
  });
}

void hideLoadingDialog() {
  Get.back();
}

