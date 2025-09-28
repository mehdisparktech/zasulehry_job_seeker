import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import '../../../../../core/config/route/app_routes.dart';
import 'package:get/get.dart';
import '../../../core/services/storage/storage_services.dart';
import '../../../core/utils/enum/enum.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      _handleNavigation();
    });
    super.initState();
  }

  void _handleNavigation() {
    if (LocalStorage.isLogIn) {
      // Navigate based on user role
      if (LocalStorage.userRole == UserRole.employer) {
        Get.offAllNamed(AppRoutes.employerDashboard);
      } else {
        Get.offAllNamed(AppRoutes.jobSeekerDashboard);
      }
    } else {
      Get.offAllNamed(AppRoutes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF083E4B),
                  Color(0xFF074E5E),
                  Color(0xFF0288A6),
                ],
                stops: [0.0, 0.4, 1.0],
              ),
            ),
            child: Center(
              child: CommonText(
                text: 'P',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
