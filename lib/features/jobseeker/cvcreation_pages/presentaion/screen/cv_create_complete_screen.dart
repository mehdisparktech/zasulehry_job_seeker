import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/glass_effect_icon.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/core/utils/helpers/other_helper.dart';

class CvCreateCompleteScreen extends StatelessWidget {
  const CvCreateCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: "cv complete"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileImageSection(),
            24.height,
            _buildHeading(title: "Personal Information"),
            24.height,
            _buildHeading(title: "educational information"),
            24.height,
            _buildHeading(title: "work experience"),
            24.height,
            _buildHeading(title: "current working"),
            24.height,
            _buildHeading(title: "skills/activities"),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Row(
            children: [
              Expanded(
                child: CommonButton(
                  titleText: "Download",
                  isGradient: false,
                  buttonColor: Colors.white,
                  titleColor: AppColors.blue500,
                ),
              ),
              6.width,
              Expanded(child: CommonButton(titleText: "Upload")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImageSection() {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            begin: Alignment(-0.9, 0),
            end: Alignment(1.0, 0),
            colors: [Color(0xFF083E4B), Color(0xFF074E5E), Color(0xFF0288A6)],
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: AssetImage(AppImages.profile),
                    ),

                    Positioned(
                      bottom: -8,
                      right: -8,
                      child: GlassEffectIcon(icon: AppImages.camera),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                TextButton(
                  onPressed: () => OtherHelper.openGallery(),
                  child: CommonText(
                    text: 'Upload Image',
                    fontSize: 18.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GlassEffectIcon(icon: AppImages.editFile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeading({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.backgroundGradient2, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.backgroundGradient2,
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.backgroundGradient2,
            size: 20.w,
          ),
        ],
      ),
    );
  }
}
