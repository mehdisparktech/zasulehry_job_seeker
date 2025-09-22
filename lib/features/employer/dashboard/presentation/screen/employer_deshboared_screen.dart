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
        title: 'Welcome To JobsinApp',
        subtitle: 'Google',
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
              // My Posted Jobs
              Item(
                icon: Icons.assignment,
                title: AppString.myPostedJobs,
                onTap: () => Get.toNamed(AppRoutes.employerPostedJobs),
              ),

              // Post Job
              Item(
                icon: Icons.add_box_outlined,
                title: AppString.postJob,
                onTap: () => Get.toNamed(AppRoutes.employerPostJob),
              ),

              // AI Tools
              Item(
                icon: Icons.auto_awesome,
                title: AppString.aiTools,
                onTap: () => Get.toNamed(AppRoutes.employerAiTools),
              ),

              // Appointments
              Item(
                icon: Icons.calendar_today,
                title: AppString.appointments,
                onTap: () => Get.toNamed(AppRoutes.employerAppointments),
              ),

              // WhatsApp Support
              Item(
                icon: Icons.chat,
                title: AppString.whatsappSupport,
                // If there is a chat/message route for employer, navigate there
                onTap: () => Get.toNamed(AppRoutes.employerMessage),
              ),

              // Add WhatsApp Link
              Item(
                icon: Icons.link,
                title: AppString.addWhatsappLink,
                onTap: null,
              ),

              // Contact & Support
              Item(
                icon: Icons.support_agent,
                title: AppString.contactAndSupport,
                onTap: () => Get.toNamed(AppRoutes.employerContactSupport),
              ),

              // Download Center
              Item(
                icon: Icons.download,
                title: AppString.downloadCenter,
                onTap: () => Get.toNamed(AppRoutes.employerDownloadCenter),
              ),

              // Verify Account
              Item(
                icon: Icons.verified_user,
                title: AppString.verifyAccount,
                onTap: () => Get.toNamed(AppRoutes.employerVerifyAccount),
              ),

              // Salary Calculator
              Item(
                icon: Icons.calculate,
                title: AppString.salaryCalculator,
                onTap: () => Get.toNamed(AppRoutes.employerSalaryCalculator),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 0),
    );
  }
}
