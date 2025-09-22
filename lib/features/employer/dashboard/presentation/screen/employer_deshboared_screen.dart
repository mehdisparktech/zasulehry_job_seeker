import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/item.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';

class EmployerDeshboaredScreen extends StatelessWidget {
  const EmployerDeshboaredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Welcome To Percenter',
        subtitle: 'Example Name',
        isCenterTitle: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 24.r,
            child: CommonImage(
              imageSrc: AppImages.google,
              width: 30.w,
              height: 30.h,
            ),
          ),
        ),
        isBackButton: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: AppColors.white),
            color: AppColors.white,
          ),
        ],
      ),
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
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 0),
    );
  }
}
