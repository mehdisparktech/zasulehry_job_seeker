import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/utils/constants/app_colors.dart';
import '../../../../../core/config/route/app_routes.dart';
import '../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/utils/constants/app_images.dart';
import '../../../core/utils/constants/app_string.dart';
import '../../../core/component/button/common_button.dart';
import '../../../core/component/image/common_image.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            180.height,
            const Center(
              child: CommonImage(imageSrc: AppImages.noImage, size: 70),
            ),
            120.height,

            CommonText(
              text: AppString.welcometitle,
              fontSize: 28,
              color: AppColors.blue500,
              fontWeight: FontWeight.w700,
            ),
            10.height,

            CommonText(text: AppString.welcomesubtitle),
            Spacer(),
            CommonButton(
              titleText: AppString.getStarted,
              onTap: () => Get.toNamed(AppRoutes.selectRole),
            ),
          ],
        ),
      ),
    );
  }
}
