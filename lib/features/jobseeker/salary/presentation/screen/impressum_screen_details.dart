import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/salary/presentation/screen/salary_comparison_details_screen.dart';

class ImpressumScreenDetails extends StatelessWidget {
  const ImpressumScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: AppString.salaryComparison),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header - InApp Salary Scale
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF083E4B),
                          Color(0xFF074E5E),
                          Color(0xFF0288A6),
                        ],
                        stops: [0.0, 0.4, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: CommonText(
                      text: "InApp Salary Scale",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                // Min Salary
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Min \$2563",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 16.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.35,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF083E4B),
                                Color(0xFF074E5E),
                                Color(0xFF0288A6),
                              ],
                              stops: [0.0, 0.4, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Max Salary
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Max \$56582",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 16.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF083E4B),
                            Color(0xFF074E5E),
                            Color(0xFF0288A6),
                          ],
                          stops: [0.0, 0.4, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                // Location Text
                CommonText(
                  text: "JobsInApp Results",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  textAlign: TextAlign.left,
                ),

                SizedBox(height: 5.h),

                CommonText(
                  text: "City,State,Country",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600]!,
                  textAlign: TextAlign.left,
                ),

                SizedBox(height: 40.h),

                // Your Salary Section
                Column(
                  children: [
                    CommonText(
                      text: "\$2005",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F7B8A),
                      left: 100.w,
                    ),
                    SizedBox(height: 8.h),
                    CommonText(
                      text: "You Salary",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      left: 100.w,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
                CommonImage(
                  imageSrc: AppImages.silder,
                  width: MediaQuery.of(context).size.width - 40.w,
                ),

                SizedBox(height: 20.h),

                // Average Salary
                Column(
                  children: [
                    CommonText(
                      text: "Average Salary",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      left: 150.w,
                    ),
                    SizedBox(height: 8.h),
                    CommonText(
                      text: "\$2005",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F7B8A),
                      left: 150.w,
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                // Salary Comparison
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.thumb_up,
                          color: Color(0xFF0F7B8A),
                          size: 18.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: CommonText(
                            text:
                                "Great,Your Salary Is Above Then Average Salary",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.thumb_down,
                          color: Color(0xFF0F7B8A),
                          size: 18.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: CommonText(
                            text: "Your Salary Is Less Then Average Salary",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 50.h),

                // More Details Button
                Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF083E4B),
                        Color(0xFF074E5E),
                        Color(0xFF0288A6),
                      ],
                      stops: [0.0, 0.4, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25.r),
                      onTap: () {
                        // Handle more details action
                        Get.to(() => SalaryComparisonDetailsScreen());
                      },
                      child: Center(
                        child: CommonText(
                          text: "More Details",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
