import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/button/common_button.dart';
import '../../../../component/other_widgets/common_loader.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../services/storage/storage_services.dart';
import '../controller/job_seeker_dashboard_controller.dart';
import '../widgets/job_card.dart';
import '../widgets/stats_card.dart';

class JobSeekerDashboardScreen extends StatelessWidget {
  const JobSeekerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: "Welcome back,",
              fontSize: 14,
              color: AppColors.textFiledColor,
            ),
            CommonText(
              text: LocalStorage.myName.isNotEmpty
                  ? LocalStorage.myName
                  : "Job Seeker",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: GetBuilder<JobSeekerDashboardController>(
        init: JobSeekerDashboardController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CommonLoader());
          }

          return RefreshIndicator(
            onRefresh: controller.loadDashboardData,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Quick Actions Section
                  Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          titleText: "Find Jobs",
                          onTap: () => Get.toNamed(AppRoutes.jobSearch),
                          buttonColor: AppColors.primaryColor,
                          titleColor: AppColors.white,
                          buttonHeight: 40,
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: CommonButton(
                          titleText: "My Applications",
                          onTap: () =>
                              Get.toNamed(AppRoutes.applicationTracking),
                          buttonColor: AppColors.primaryColor.withOpacity(0.1),
                          titleColor: AppColors.primaryColor,
                          buttonHeight: 40,
                        ),
                      ),
                    ],
                  ),

                  24.height,

                  /// Stats Section
                  Row(
                    children: [
                      Expanded(
                        child: StatsCard(
                          title: "Applications",
                          value: controller.totalApplications.toString(),
                          icon: Icons.work_outline,
                          color: Colors.blue,
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: StatsCard(
                          title: "Pending",
                          value: controller.pendingApplications.toString(),
                          icon: Icons.pending_outlined,
                          color: Colors.orange,
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: StatsCard(
                          title: "Interviews",
                          value: controller.interviewScheduled.toString(),
                          icon: Icons.event_outlined,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  24.height,

                  /// Recent Jobs Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CommonText(
                        text: "Recent Jobs",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.jobSearch),
                        child: const CommonText(
                          text: "View All",
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),

                  12.height,

                  /// Jobs List
                  controller.isLoadingJobs
                      ? const Center(child: CommonLoader())
                      : controller.jobs.isEmpty
                      ? Container(
                          height: 200.h,
                          alignment: Alignment.center,
                          child: const CommonText(
                            text: "No jobs available",
                            fontSize: 16,
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.jobs.take(3).length,
                          separatorBuilder: (context, index) => 12.height,
                          itemBuilder: (context, index) {
                            final job = controller.jobs[index];
                            return JobCard(
                              job: job,
                              onApply: () => controller.applyToJob(job['id']),
                              onSave: () => controller.saveJob(job['id']),
                              onTap: () => controller.viewJobDetails(job['id']),
                            );
                          },
                        ),

                  24.height,

                  /// Recommendations Section
                  const CommonText(
                    text: "Recommended for You",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),

                  12.height,

                  controller.recommendations.isEmpty
                      ? Container(
                          height: 100.h,
                          alignment: Alignment.center,
                          child: const CommonText(
                            text: "No recommendations yet",
                            fontSize: 14,
                          ),
                        )
                      : SizedBox(
                          height: 120.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.recommendations.length,
                            separatorBuilder: (context, index) => 12.width,
                            itemBuilder: (context, index) {
                              final recommendation =
                                  controller.recommendations[index];
                              return Container(
                                width: 200.w,
                                padding: EdgeInsets.all(16.w),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: recommendation['title'],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 2,
                                    ),
                                    4.height,
                                    CommonText(
                                      text: recommendation['company'],
                                      fontSize: 12,
                                      color: AppColors.textFiledColor,
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CommonText(
                                          text:
                                              "${recommendation['match']} match",
                                          fontSize: 12,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CommonText(
                                          text: recommendation['location'],
                                          fontSize: 12,
                                          color: AppColors.textFiledColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 0),
    );
  }
}

extension SpaceExtension on num {
  Widget get verticalSpace => SizedBox(height: toDouble().h);
  Widget get horizontalSpace => SizedBox(width: toDouble().w);
}
