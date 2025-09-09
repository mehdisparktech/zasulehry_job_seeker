import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../component/other_widgets/common_loader.dart';
import '../../../../../component/other_widgets/no_data.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../controller/candidate_management_controller.dart';
import '../widgets/application_item.dart';

class CandidateManagementScreen extends StatelessWidget {
  const CandidateManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: "Applications",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<CandidateManagementController>(
        init: CandidateManagementController(),
        builder: (controller) {
          return Column(
            children: [
              /// Search and Filter Section
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  children: [
                    /// Search Bar
                    CommonTextField(
                      hintText: "Search candidates...",
                      prefixIcon: const Icon(Icons.search),
                      onSubmitted: controller.searchApplications,
                    ),

                    16.height,

                    /// Filter Chips
                    SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.statusFilters.length,
                        separatorBuilder: (context, index) => 8.width,
                        itemBuilder: (context, index) {
                          final filter = controller.statusFilters[index];
                          final isSelected =
                              controller.selectedFilter == filter;

                          return InkWell(
                            onTap: () => controller.filterApplications(filter),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : AppColors.filledColor,
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : AppColors.textFiledColor,
                                ),
                              ),
                              child: CommonText(
                                text: filter,
                                fontSize: 12,
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.black,
                                fontWeight: isSelected
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              /// Applications List
              Expanded(
                child: controller.isLoading
                    ? const Center(child: CommonLoader())
                    : controller.filteredApplications.isEmpty
                    ? const NoData()
                    : RefreshIndicator(
                        onRefresh: controller.fetchApplications,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemCount: controller.filteredApplications.length,
                          separatorBuilder: (context, index) => 12.height,
                          itemBuilder: (context, index) {
                            final application =
                                controller.filteredApplications[index];
                            return ApplicationItem(
                              application: application,
                              onStatusUpdate: (newStatus) =>
                                  controller.updateApplicationStatus(
                                    application['id'],
                                    newStatus,
                                  ),
                              onScheduleInterview: () => controller
                                  .scheduleInterview(application['id']),
                              onViewProfile: () =>
                                  controller.viewCandidateProfile(
                                    application['candidateId'],
                                  ),
                              onDownloadResume: () => controller.downloadResume(
                                application['resumeUrl'],
                              ),
                              onSendMessage: () => controller.sendMessage(
                                application['candidateId'],
                              ),
                              onShortlist: () => controller.shortlistCandidate(
                                application['id'],
                              ),
                              onReject: () =>
                                  controller.rejectCandidate(application['id']),
                              onHire: () =>
                                  controller.hireCandidate(application['id']),
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
}
