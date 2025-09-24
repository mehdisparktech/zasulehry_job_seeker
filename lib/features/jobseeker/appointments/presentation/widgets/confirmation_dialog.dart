import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmationDialog({
    super.key,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  });

  static void show({
    required String message,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) {
    Get.dialog(
      ConfirmationDialog(
        message: message,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: CommonText(text: message, fontSize: 18.sp, maxLines: 2),
      actions: [
        Row(
          children: [
            Expanded(
              child: CommonButton(
                onTap: onCancel,
                titleText: 'No',
                titleColor: AppColors.white,
                buttonColor: AppColors.red2,
                borderColor: AppColors.red2,
                isGradient: false,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CommonButton(
                onTap: onConfirm,
                titleText: 'Yes',
                titleColor: AppColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
