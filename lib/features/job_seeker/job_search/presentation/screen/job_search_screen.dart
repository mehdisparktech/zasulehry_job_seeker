import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../component/other_widgets/common_loader.dart';
import '../../../../../component/other_widgets/no_data.dart';
import '../../../../../component/pop_up/common_pop_menu.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../controller/job_search_controller.dart';
import '../widgets/job_search_card.dart';
import '../widgets/filter_bottom_sheet.dart';

class JobSearchScreen extends StatelessWidget {
  const JobSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: "Find Jobs",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          GetBuilder<JobSearchController>(
            init: JobSearchController(),
            builder: (controller) => IconButton(
              onPressed: () => _showFilterBottomSheet(context, controller),
              icon: const Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
      body: GetBuilder<JobSearchController>(
        init: JobSearchController(),
        builder: (controller) {
          return Column(
            children: [
              /// Search Section
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  children: [
                    /// Search Bar
                    CommonTextField(
                      hintText: "Search jobs, companies...",
                      prefixIcon: const Icon(Icons.search),
                      onSubmitted: controller.searchJobs,
                    ),

                    16.height,

                    /// Quick Filters
                    Row(
                      children: [
                        Expanded(
                          child: PopUpMenu(
                            items: controller.locations,
                            selectedItem: [controller.selectedLocation],
                            onTap: (index) => controller.setLocation(
                              controller.locations[index],
                            ),
                            isContainer: true,
                          ),
                        ),
                        8.width,
                        Expanded(
                          child: PopUpMenu(
                            items: controller.jobTypes,
                            selectedItem: [controller.selectedJobType],
                            onTap: (index) => controller.setJobType(
                              controller.jobTypes[index],
                            ),
                            isContainer: true,
                          ),
                        ),
                        8.width,
                        InkWell(
                          onTap: () =>
                              _showFilterBottomSheet(context, controller),
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: AppColors.primaryColor),
                            ),
                            child: const Icon(
                              Icons.tune,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// Filter Status
                    if (controller.searchQuery.isNotEmpty ||
                        controller.selectedLocation != "All Locations" ||
                        controller.selectedJobType != "All Types" ||
                        controller.selectedExperience != "All Levels" ||
                        controller.selectedSalary != "All Ranges")
                      Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: CommonText(
                                text:
                                    "${controller.filteredJobs.length} jobs found",
                                fontSize: 14,
                                color: AppColors.textFiledColor,
                              ),
                            ),
                            TextButton(
                              onPressed: controller.clearFilters,
                              child: const CommonText(
                                text: "Clear Filters",
                                color: AppColors.primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),

              /// Jobs List
              Expanded(
                child: controller.isLoading
                    ? const Center(child: CommonLoader())
                    : controller.filteredJobs.isEmpty
                    ? const NoData()
                    : RefreshIndicator(
                        onRefresh: controller.fetchJobs,
                        child: ListView.separated(
                          controller: controller.scrollController,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemCount:
                              controller.filteredJobs.length +
                              (controller.isLoadingMore ? 1 : 0),
                          separatorBuilder: (context, index) => 12.height,
                          itemBuilder: (context, index) {
                            if (index >= controller.filteredJobs.length) {
                              return const Center(child: CommonLoader());
                            }

                            final job = controller.filteredJobs[index];
                            return JobSearchCard(
                              job: job,
                              onApply: () => controller.applyToJob(job['id']),
                              onSave: () => controller.saveJob(job['id']),
                              onTap: () => controller.viewJobDetails(job['id']),
                              isSaved: controller.isJobSaved(job['id']),
                            );
                          },
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showFilterBottomSheet(
    BuildContext context,
    JobSearchController controller,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) => FilterBottomSheet(controller: controller),
    );
  }
}
