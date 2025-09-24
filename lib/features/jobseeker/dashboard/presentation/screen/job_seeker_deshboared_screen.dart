import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/item.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';

class JobSeekerDeshboaredScreen extends StatelessWidget {
  const JobSeekerDeshboaredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.dashboard, isBackButton: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Item(
                image: AppImages.person2,
                title: AppString.myAppliedJobs,
                onTap: () => Get.toNamed(AppRoutes.myAppliedJobs),
              ),

              /// Approved Jobs Item here
              Item(
                title: AppString.approvedJobs,
                image: AppImages.approvedJob,
                onTap: () => Get.toNamed(AppRoutes.approvedJobs),
              ),

              /// Pending Jobs Item here
              Item(
                title: AppString.pendingJobs,
                image: AppImages.pendingJob,
                onTap: () => Get.toNamed(AppRoutes.pendingJobs),
              ),

              /// Canceled Jobs Item here
              Item(
                onTap: () => Get.toNamed(AppRoutes.canceledJobs),
                title: AppString.canceledJobs,
                image: AppImages.cancelledJob,
              ),

              /// Saved Jobs Item here
              Item(
                title: AppString.savedJobs,
                icon: Icons.favorite,
                onTap: () => Get.toNamed(AppRoutes.savedJobs),
              ),

              Item(
                image: AppImages.feedback,
                title: AppString.feedback,
                onTap: () => Get.toNamed(AppRoutes.feedback),
              ),

              /// Appointments Item here
              Item(
                image: AppImages.appointments,
                title: AppString.appointments,
                onTap: () => Get.toNamed(AppRoutes.appointments),
              ),

              /// Resume Creation Item here
              Item(
                image: AppImages.resume,
                title: AppString.jobsinAppResumeCreation,
                onTap: () => Get.toNamed(AppRoutes.resumeCreation),
              ),
              Item(
                image: AppImages.calculator,
                title: AppString.salaryCalculator,
                onTap: () => Get.toNamed(AppRoutes.salaryCalculatorScreen),
              ),
              Item(
                image: AppImages.comparison,
                title: AppString.salaryComparison,
                onTap: () => Get.toNamed(AppRoutes.salaryComparison),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 1),
    );
  }
}
