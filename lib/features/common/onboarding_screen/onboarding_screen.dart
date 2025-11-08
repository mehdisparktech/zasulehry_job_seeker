import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
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
              Center(child: CommonImage(imageSrc: AppImages.logo)),

              40.height,

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
                  onTap: () => Get.toNamed(AppRoutes.selectRole),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
