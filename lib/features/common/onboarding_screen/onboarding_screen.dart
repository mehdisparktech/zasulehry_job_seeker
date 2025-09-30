import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import '../../../../../core/config/route/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/component/button/common_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            children: [
              180.height,
              Center(
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
              26.height,
              CommonText(
                text: AppString.welcometitle,
                fontSize: 38.sp,
                color: AppColors.blue500,
                fontWeight: FontWeight.w700,
              ),
              10.height,

              CommonText(
                text: AppString.welcomesubtitle,
                color: AppColors.blue500,
                fontSize: 22.sp,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CommonButton(
                  titleText: AppString.getStarted,
                  onTap: () => Get.toNamed(AppRoutes.signIn),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
