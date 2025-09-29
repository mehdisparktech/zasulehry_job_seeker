import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/services/storage/storage_services.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/enum/enum.dart';
import '../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectRouleScreen extends StatelessWidget {
  const SelectRouleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: "Are You",
                  color: AppColors.blue500,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
                20.height,
                selectRoleCard(
                  text: "A Job Seeker",
                  imageSrc: AppImages.seeker,
                  onTap: () {
                    LocalStorage.userRole = UserRole.jobSeeker;
                    Get.toNamed(AppRoutes.signIn);
                  },
                  isSeleted: true,
                ),
                20.height,
                selectRoleCard(
                  text: "An Employer",
                  imageSrc: AppImages.employer,
                  onTap: () {
                    LocalStorage.userRole = UserRole.employer;
                    Get.toNamed(AppRoutes.signIn);
                  },
                  isSeleted: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectRoleCard({
    required String text,
    required String imageSrc,
    required VoidCallback onTap,
    required bool isSeleted,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        width: 240,
        decoration: BoxDecoration(
          color: isSeleted ? null : Colors.white,
          gradient: isSeleted
              ? LinearGradient(
                  begin: Alignment(-0.9, 0),
                  end: Alignment(1.0, 0),
                  colors: [
                    Color(0xFF083E4B), // #083E4B
                    Color(0xFF074E5E), // #074E5E
                    Color(0xFF0288A6), // #0288A6
                  ],
                  stops: [0.0, 0.4, 1.0],
                )
              : null,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            20.height,
            CommonImage(imageSrc: imageSrc, height: 64, width: 64),
            20.height,
            CommonText(
              text: text,
              color: isSeleted ? AppColors.white : AppColors.black,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
