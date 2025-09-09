import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/pop_up/common_pop_menu.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../controller/job_search_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  final JobSearchController controller;

  const FilterBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      height: MediaQuery.of(context).size.height * 0.7,
      child: GetBuilder<JobSearchController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                const Expanded(
                  child: CommonText(
                    text: "Filter Jobs",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.clearFilters();
                    Get.back();
                  },
                  child: const CommonText(
                    text: "Clear All",
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),

            const Divider(),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Location Filter
                    const CommonText(
                      text: "Location",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      bottom: 8,
                    ),
                    PopUpMenu(
                      items: controller.locations,
                      selectedItem: [controller.selectedLocation],
                      onTap: (index) =>
                          controller.setLocation(controller.locations[index]),
                      isContainer: true,
                    ),

                    20.height,

                    /// Job Type Filter
                    const CommonText(
                      text: "Job Type",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      bottom: 8,
                    ),
                    PopUpMenu(
                      items: controller.jobTypes,
                      selectedItem: [controller.selectedJobType],
                      onTap: (index) =>
                          controller.setJobType(controller.jobTypes[index]),
                      isContainer: true,
                    ),

                    20.height,

                    /// Experience Level Filter
                    const CommonText(
                      text: "Experience Level",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      bottom: 8,
                    ),
                    PopUpMenu(
                      items: controller.experienceLevels,
                      selectedItem: [controller.selectedExperience],
                      onTap: (index) => controller.setExperience(
                        controller.experienceLevels[index],
                      ),
                      isContainer: true,
                    ),

                    20.height,

                    /// Salary Range Filter
                    const CommonText(
                      text: "Salary Range",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      bottom: 8,
                    ),
                    PopUpMenu(
                      items: controller.salaryRanges,
                      selectedItem: [controller.selectedSalary],
                      onTap: (index) =>
                          controller.setSalary(controller.salaryRanges[index]),
                      isContainer: true,
                    ),

                    30.height,
                  ],
                ),
              ),
            ),

            /// Apply Button
            CommonButton(
              titleText:
                  "Apply Filters (${controller.filteredJobs.length} jobs)",
              onTap: () => Get.back(),
              buttonColor: AppColors.primaryColor,
              titleColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
