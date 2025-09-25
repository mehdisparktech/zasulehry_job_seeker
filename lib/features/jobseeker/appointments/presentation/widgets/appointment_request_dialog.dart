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
  const AppointmentRequestDialog({super.key, this.isConfirm = false});

  static void show({required bool isConfirm}) {
    Get.dialog(AppointmentRequestDialog(isConfirm: isConfirm));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppointmentsController>();

    return AlertDialog(
      backgroundColor: AppColors.white,
      content: SizedBox(
        width: MediaQuery.of(context).size.width, // 80% of screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isConfirm) ...[
              // Obx(
              //   () => DropdownMenu<String>(
              //     dropdownMenuEntries: controller.appointmentTypes
              //         .map(
              //           (type) =>
              //               DropdownMenuEntry<String>(value: type, label: type),
              //         )
              //         .toList(),
              //     onSelected: controller.updateSelectedAppointmentType,
              //     initialSelection: controller.selectedAppointmentType.value,
              //     width: MediaQuery.of(context).size.width,
              //     inputDecorationTheme: InputDecorationTheme(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //         borderSide: BorderSide(color: AppColors.textSecondary),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(30.r),
              //         borderSide: BorderSide(color: AppColors.textSecondary),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(30.r),
              //         borderSide: BorderSide(color: AppColors.primaryColor),
              //       ),
              //       filled: true,
              //       fillColor: AppColors.white,
              //       contentPadding: const EdgeInsets.symmetric(
              //         horizontal: 16,
              //         vertical: 12,
              //       ),
              //     ),
              //     textStyle: TextStyle(color: AppColors.black, fontSize: 16),
              //   ),
              // ),
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
