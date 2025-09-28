import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/utils/enum/enum.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/controller/view_job_details_controller.dart';

class JobActionButtonsWidget extends StatelessWidget {
  final ApplyJobStatus applyJobStatus;

  const JobActionButtonsWidget({super.key, required this.applyJobStatus});

  @override
  Widget build(BuildContext context) {
    final controller = ViewJobDetailsController.instance;

    return Obx(
      () => Row(
        children: [
          if (controller.shouldShowSaveButton())
            Expanded(
              child: _buildButton('Save', controller.saveJob, isSave: true),
            ),
          if (controller.shouldShowSaveButton()) SizedBox(width: 24.w),
          if (controller.shouldShowMainButton())
            Expanded(
              child: _buildButton(
                controller.getButtonText(),
                controller.handleMainButtonAction,
                isGradient: controller.shouldButtonHaveGradient(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildButton(
    String text,
    VoidCallback onTap, {
    bool isGradient = false,
    bool isSave = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isGradient ? null : AppColors.white,
        gradient: isGradient
            ? const LinearGradient(
                begin: Alignment(-0.9, 0),
                end: Alignment(1.0, 0),
                colors: [
                  Color(0xFF083E4B), // #083E4B
                  Color(0xFF074E5E), // #074E5E
                  Color(0xFF0288A6), // #0288A6
                ],
                stops: [0.0, 0.4, 1.0],
              )
            : null,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _getBorderColor(), width: 2),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            height: 50.h,
            width: double.infinity,
            alignment: Alignment.center,
            child: CommonText(
              text: text,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: !isSave ? _getTextColor() : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Color _getBorderColor() {
    final controller = ViewJobDetailsController.instance;
    final borderColor = controller.getButtonBorderColor();

    switch (borderColor) {
      case 'red':
        return AppColors.red;
      case 'red2':
        return AppColors.red2;
      case 'primary':
      default:
        return AppColors.primaryColor;
    }
  }

  Color _getTextColor() {
    final controller = ViewJobDetailsController.instance;
    final textColor = controller.getButtonTextColor();

    switch (textColor) {
      case 'white':
        return AppColors.white;
      case 'red2':
        return AppColors.red2;
      case 'primary':
      default:
        return AppColors.primaryColor;
    }
  }
}
