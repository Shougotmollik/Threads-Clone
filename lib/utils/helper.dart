import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theadsclone/utils/app_colors.dart';

void showSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: AppColors.darkThemeAppBarColor,
    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
    snackStyle: SnackStyle.GROUNDED,
    margin: EdgeInsets.all(0.0),
  );
}
