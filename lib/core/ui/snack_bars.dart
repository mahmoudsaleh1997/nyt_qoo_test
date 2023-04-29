import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';

import '../app_colors.dart';

class AppSnackBars {
  static showWarningSnackBar({
    required String title,
    required String description,
  }) {
    Get.snackbar(
      title,
      description,
      snackPosition: SnackPosition.BOTTOM,
      borderWidth: 1,
      backgroundColor: AppColors.gold.withOpacity(0.5),
      icon: const Icon(Icons.warning),
      isDismissible: true,
      borderColor: AppColors.gold.withOpacity(0.8),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }


  static showErrorSnackBar({
    required String title,
    required String description,

  }) {
    Get.snackbar(
      title,
      description,
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColors.white,
      borderWidth: 1,
      backgroundColor: AppColors.redAccent.withOpacity(0.5),
      icon: const Icon(Icons.error),
      isDismissible: true,
      borderColor: AppColors.redAccent.withOpacity(0.8),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }


  static showSuccessSnackBar({
    required String title,
    required String description,
  }) {
    Get.snackbar(
      title,
      description,
      snackPosition: SnackPosition.BOTTOM,
      borderWidth: 1,
      backgroundColor: AppColors.greenAccent.withOpacity(0.5),
      icon: const Icon(Icons.done),
      isDismissible: true,
      borderColor: AppColors.greenAccent.withOpacity(0.8),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  static showNoInternetSnackBar() {
    Get.snackbar(
      'no_connection'.tr,
      'no_connection_desc',
      snackPosition: SnackPosition.BOTTOM,
      borderWidth: 1,
      backgroundColor: AppColors.grey.withOpacity(0.5),
      icon: const Icon(Icons.signal_wifi_connected_no_internet_4_sharp),
      isDismissible: false,
      duration: const Duration(seconds: 60),

      borderColor: AppColors.greenAccent.withOpacity(0.8),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  static showConnectionRestoredSnackBar() {
    Get.snackbar(
      'connection_restored'.tr,
      'connection_restored_desc',
      snackPosition: SnackPosition.BOTTOM,
      borderWidth: 1,
      backgroundColor: AppColors.grey.withOpacity(0.5),
      icon: const Icon(Icons.wifi),
      isDismissible: true,
      duration: const Duration(seconds: 2),
      borderColor: AppColors.greenAccent.withOpacity(0.8),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

}
