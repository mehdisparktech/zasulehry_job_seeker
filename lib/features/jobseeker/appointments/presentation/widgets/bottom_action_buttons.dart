import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/controller/appointments_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/widgets/appointment_request_dialog.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/widgets/confirmation_dialog.dart';

class BottomActionButtons extends StatelessWidget {
  const BottomActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppointmentsController>();

    return Obx(
      () => Column(
        children: [
          // Action Buttons Row
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                if (controller.selectedTabIndex.value == 1) ...[
                  Expanded(
                    child: CommonButton(
                      titleText: 'Confirm',
                      onTap: controller.confirmAppointment,
                      buttonRadius: 4.r,
                    ),
                  ),
                  16.width,
                ],

                if (controller.selectedTabIndex.value == 1 ||
                    controller.selectedTabIndex.value == 0) ...[
                  Expanded(
                    child: CommonButton(
                      titleText: 'Cancel',
                      onTap: () => _showCancelConfirmation(controller),
                      titleColor: AppColors.white,
                      buttonColor: AppColors.red2,
                      borderColor: AppColors.red2,
                      buttonRadius: 4.r,
                      isGradient: false,
                    ),
                  ),
                ],
              ],
            ),
          ),

          16.height,

          // Ask For Appointment Button
          if (controller.selectedTabIndex.value == 0 ||
              controller.selectedTabIndex.value == 1) ...[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              margin: EdgeInsets.only(bottom: 16.h),
              child: CommonButton(
                titleText: 'Ask For Appointment',
                onTap: () => AppointmentRequestDialog.show(),
                buttonColor: AppColors.blue500,
                titleColor: AppColors.white,
                buttonRadius: 4.r,
              ),
            ),
          ],

          40.height,
        ],
      ),
    );
  }

  void _showCancelConfirmation(AppointmentsController controller) {
    ConfirmationDialog.show(
      message: 'Are You Sure You Want To Cancel The Appointment',
      onConfirm: controller.cancelAppointment,
      onCancel: () => Get.back(),
    );
  }
}
