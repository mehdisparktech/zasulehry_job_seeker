import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/other_widgets/common_loader.dart';
import '../../../../component/button/common_button.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../services/storage/storage_services.dart';
import '../controller/employer_dashboard_controller.dart';
import '../widgets/employer_job_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/application_card.dart';

class EmployerDashboardScreen extends StatelessWidget {
  const EmployerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: "Welcome,",
              fontSize: 14,
              color: AppColors.textFiledColor,
            ),
            CommonText(
              text: LocalStorage.myName.isNotEmpty
                  ? LocalStorage.myName
                  : "Employer",
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
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_search_outlined),
          ),
        ],
      ),
      body: GetBuilder<EmployerDashboardController>(
        init: EmployerDashboardController(),
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
                  /// Quick Action Button
                  CommonButton(
                    titleText: "Post New Job",
                    onTap: controller.createNewJob,
                    buttonColor: AppColors.primaryColor,
                    titleColor: AppColors.white,
                  ),

                  20.height,

                  /// Stats Section
                  Row(
                    children: [
                      Expanded(
                        child: StatsCard(
                          title: "Total Jobs",
                          value: controller.totalJobs.toString(),
                          icon: Icons.work_outline,
                          color: Colors.blue,
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: StatsCard(
                          title: "Active Jobs",
                          value: controller.activeJobs.toString(),
                          icon: Icons.trending_up,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  12.height,

                  Row(
                    children: [
                      Expanded(
                        child: StatsCard(
                          title: "Applications",
                          value: controller.totalApplications.toString(),
                          icon: Icons.people_outline,
                          color: Colors.orange,
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: StatsCard(
                          title: "New",
                          value: controller.newApplications.toString(),
                          icon: Icons.new_releases_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),

                  24.height,

                  /// My Jobs Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CommonText(
                        text: "My Active Jobs",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to all jobs
                        },
                        child: const CommonText(
                          text: "Manage All",
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),

                  12.height,

                  /// Jobs List
                  controller.isLoadingJobs
                      ? const Center(child: CommonLoader())
                      : controller.myJobs.isEmpty
                      ? Container(
                          height: 200.h,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.work_off_outlined,
                                size: 60,
                                color: AppColors.textFiledColor,
                              ),
                              12.height,
                              const CommonText(
                                text: "No jobs posted yet",
                                fontSize: 16,
                              ),
                              8.height,
                              CommonButton(
                                titleText: "Post Your First Job",
                                onTap: controller.createNewJob,
                                buttonWidth: 200,
                                buttonHeight: 40,
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.myJobs.take(3).length,
                          separatorBuilder: (context, index) => 12.height,
                          itemBuilder: (context, index) {
                            final job = controller.myJobs[index];
                            return EmployerJobCard(
                              job: job,
                              onViewApplications: () =>
                                  controller.viewApplications(job['id']),
                              onEdit: () =>
                                  controller.viewJobDetails(job['id']),
                            );
                          },
                        ),

                  24.height,

                  /// Recent Applications Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CommonText(
                        text: "Recent Applications",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to all applications
                        },
                        child: const CommonText(
                          text: "View All",
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),

                  12.height,

                  controller.applications.isEmpty
                      ? Container(
                          height: 100.h,
                          alignment: Alignment.center,
                          child: const CommonText(
                            text: "No applications yet",
                            fontSize: 14,
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.applications.take(3).length,
                          separatorBuilder: (context, index) => 12.height,
                          itemBuilder: (context, index) {
                            final application = controller.applications[index];
                            return ApplicationCard(
                              application: application,
                              onTap: () => controller.reviewApplication(
                                application['id'],
                              ),
                            );
                          },
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
