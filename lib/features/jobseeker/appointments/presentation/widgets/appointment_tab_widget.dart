import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/controller/appointments_controller.dart';

class AppointmentTabWidget extends StatelessWidget {
  const AppointmentTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppointmentsController>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Obx(
        () => Row(
          children: controller.tabs.asMap().entries.map((entry) {
            int index = entry.key;
            String tab = entry.value;
            bool isSelected = controller.selectedTabIndex.value == index;

            return Expanded(
              child: GestureDetector(
                onTap: () => controller.selectTab(index),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.blue500 : Colors.transparent,
                    gradient: isSelected
                        ? LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF083E4B),
                              Color(0xFF074E5E),
                              Color(0xFF0288A6),
                            ],
                            stops: [0.0, 0.5, 1.0],
                          )
                        : null,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: AppColors.blue500, width: 2),
                  ),
                  child: Center(
                    child: CommonText(
                      text: tab,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? AppColors.white : AppColors.blue500,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
