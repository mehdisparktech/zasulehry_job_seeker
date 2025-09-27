import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/controller/appointments_controller.dart';

class AppointmentRequestDialog extends StatelessWidget {
  final bool isConfirm;
  final bool isReply;
  const AppointmentRequestDialog({
    super.key,
    this.isConfirm = false,
    this.isReply = false,
  });

  static void show({required bool isConfirm, required bool isReply}) {
    Get.dialog(
      AppointmentRequestDialog(isConfirm: isConfirm, isReply: isReply),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppointmentsController>();

    return AlertDialog(
      backgroundColor: AppColors.white,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            10.height,
            if (isReply) ...[
              CommonTextField(
                hintText: 'Type Contact Number',
                borderRadius: 8.r,
                paddingVertical: 12,
                paddingHorizontal: 16,
                borderColor: AppColors.textSecondary,
                fillColor: AppColors.white,
                textColor: AppColors.black,
              ),
              16.height,
            ],
            if (!isConfirm) ...[
              CommonTextField(
                hintText: 'Search Employer',
                borderRadius: 30.r,
                paddingVertical: 12,
                paddingHorizontal: 16,
                borderColor: AppColors.textSecondary,
                fillColor: AppColors.white,
                textColor: AppColors.black,
                suffixIcon: Icon(Icons.arrow_drop_down_outlined),
              ),
              16.height,
            ],
            CommonTextField(
              controller: controller.messageController,
              hintText: 'Enter Your Message',
              maxLines: 5,
              validator: (value) => controller.validateMessage(value),
              borderRadius: 8,
              paddingVertical: 12,
              paddingHorizontal: 16,
              borderColor: AppColors.textSecondary,
              fillColor: AppColors.white,
              textColor: AppColors.black,
              hintTextColor: AppColors.textFiledColor,
            ),
            16.height,
            CommonButton(
              titleText: 'Send',
              onTap: controller.sendAppointmentRequest,
            ),
          ],
        ),
      ),
    );
  }
}
