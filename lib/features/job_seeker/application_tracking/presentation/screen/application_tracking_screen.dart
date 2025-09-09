import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/other_widgets/common_loader.dart';
import '../../../../../component/other_widgets/no_data.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../controller/application_tracking_controller.dart';
import '../widgets/application_status_card.dart';
import '../widgets/application_summary_cards.dart';

class ApplicationTrackingScreen extends StatelessWidget {
  const ApplicationTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: "My Applications",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<ApplicationTrackingController>(
        init: ApplicationTrackingController(),
        builder: (controller) {
          return Column(
            children: [
              /// Summary Cards
              ApplicationSummaryCards(controller: controller),

              16.height,

              /// Filter Chips
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.statusFilters.length,
                    separatorBuilder: (context, index) => 8.width,
                    itemBuilder: (context, index) {
                      final filter = controller.statusFilters[index];
                      final isSelected = controller.selectedFilter == filter;

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
              ),

              16.height,

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
                            return ApplicationStatusCard(
                              application: application,
                              onTap: () => controller.viewApplicationDetails(
                                application['id'],
                              ),
                              onWithdraw:
                                  application['status'] != 'Hired' &&
                                      application['status'] != 'Rejected' &&
                                      application['status'] != 'Withdrawn'
                                  ? () => controller.withdrawApplication(
                                      application['id'],
                                    )
                                  : null,
                              statusColor: controller.getStatusColor(
                                application['status'],
                              ),
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
