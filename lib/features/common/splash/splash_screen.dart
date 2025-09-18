import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import '../../../../../core/config/route/app_routes.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/component/image/common_image.dart';
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
      body: CommonImage(imageSrc: AppImages.noImage, size: 70).center,
    );
  }
}
