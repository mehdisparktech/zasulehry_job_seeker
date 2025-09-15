import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/services/storage/storage_services.dart';
import 'package:zasulehry_job_seeker/utils/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/utils/constants/app_images.dart';
import 'package:zasulehry_job_seeker/utils/enum/enum.dart';
import '../../../../utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectRouleScreen extends StatelessWidget {
  const SelectRouleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: "Are you a",
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
              20.height,
              selectRoleCard("Job Seeker", AppImages.noImage, () {
                Get.toNamed(AppRoutes.signUp);
                LocalStorage.userRole = UserRole.jobSeeker;
              }),
              20.height,
              selectRoleCard("Employer", AppImages.noImage, () {
                Get.toNamed(AppRoutes.signUp);
                LocalStorage.userRole = UserRole.employer;
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectRoleCard(String text, String imageSrc, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        width: 240,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            CommonImage(imageSrc: imageSrc, height: 20, width: 20),
            20.height,
            CommonText(text: text),
          ],
        ),
      ),
    );
  }
}
