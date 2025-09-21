import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/item.dart';
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
                icon: Icons.person,
                title: AppString.myAppliedJobs,
                onTap: () => Get.toNamed(AppRoutes.myAppliedJobs),
              ),

              /// Approved Jobs Item here
              Item(
                title: AppString.approvedJobs,
                icon: Icons.check_circle_outline,
                onTap: () => Get.toNamed(AppRoutes.approvedJobs),
              ),

              /// Pending Jobs Item here
              Item(
                title: AppString.pendingJobs,
                icon: Icons.pending,
                onTap: () => Get.toNamed(AppRoutes.pendingJobs),
              ),

              /// Canceled Jobs Item here
              Item(
                onTap: () => Get.toNamed(AppRoutes.canceledJobs),
                title: AppString.canceledJobs,
                icon: Icons.cancel,
              ),

              /// Saved Jobs Item here
              Item(
                title: AppString.savedJobs,
                icon: Icons.favorite,
                onTap: () => Get.toNamed(AppRoutes.savedJobs),
              ),

              Item(
                icon: Icons.feedback,
                title: AppString.feedback,
                onTap: () => Get.toNamed(AppRoutes.feedback),
              ),

              /// Appointments Item here
              Item(
                icon: Icons.calendar_today,
                title: AppString.appointments,
                onTap: () => Get.toNamed(AppRoutes.appointments),
              ),

              /// Resume Creation Item here
              Item(
                icon: Icons.document_scanner_outlined,
                title: AppString.jobsinAppResumeCreation,
                onTap: () => Get.toNamed(AppRoutes.resumeCreation),
              ),
              Item(
                icon: Icons.calculate,
                title: AppString.salaryCalculator,
                onTap: () => Get.toNamed(AppRoutes.salaryCalculator),
              ),
              Item(
                icon: Icons.compare,
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
