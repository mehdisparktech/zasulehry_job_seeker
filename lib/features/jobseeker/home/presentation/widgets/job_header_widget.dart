import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/data/model/job_details_model.dart';

class JobHeaderWidget extends StatelessWidget {
  final JobDetailsModel jobDetails;

  const JobHeaderWidget({super.key, required this.jobDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCompanyAndSalaryRow(),
        SizedBox(height: 16.h),
        _buildJobTitle(),
        SizedBox(height: 12.h),
        _buildLocationAndDateRow(),
        SizedBox(height: 8.h),
        _buildDistanceRow(),
      ],
    );
  }

  Widget _buildCompanyAndSalaryRow() {
    return Row(
      children: [
        CommonImage(imageSrc: AppImages.google, width: 28.w, height: 28.h),
        SizedBox(width: 8.w),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: jobDetails.companyName,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                textAlign: TextAlign.left,
              ),
              SizedBox(width: 4.w),
              CommonText(
                text: jobDetails.salary,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildJobTitle() {
    return Row(
      children: [
        CommonText(
          text: jobDetails.jobTitle,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.blue500,
          textAlign: TextAlign.left,
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.blue500,
            borderRadius: BorderRadius.circular(100.r),
            gradient: LinearGradient(
              begin: Alignment(-0.9, 0),
              end: Alignment(1.0, 0),
              colors: [
                Color(0xFF083E4B), // #083E4B
                Color(0xFF074E5E), // #074E5E
                Color(0xFF0288A6), // #0288A6
              ],
              stops: [0.0, 0.4, 1.0],
            ),
          ),
          child: Icon(
            Icons.favorite_border,
            size: 24.sp,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationAndDateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildLocationInfo(), _buildDateInfo()],
    );
  }

  Widget _buildLocationInfo() {
    return Row(
      children: [
        CommonImage(
          imageSrc: AppImages.location,
          width: 16.w,
          height: 16.h,
          imageColor: AppColors.black,
        ),
        SizedBox(width: 6.w),
        CommonText(
          text: jobDetails.address,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.left,
          color: AppColors.textSecondary,
        ),
      ],
    );
  }

  Widget _buildDateInfo() {
    return Row(
      children: [
        CommonImage(
          imageSrc: AppImages.clock,
          width: 16.w,
          height: 16.h,
          imageColor: AppColors.black,
        ),
        SizedBox(width: 6.w),
        CommonText(
          text: jobDetails.postedDate,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.left,
          color: AppColors.textSecondary,
        ),
      ],
    );
  }

  Widget _buildDistanceRow() {
    return Row(
      children: [
        CommonImage(
          imageSrc: AppImages.location,
          width: 16.w,
          height: 16.h,
          imageColor: AppColors.black,
        ),
        SizedBox(width: 6.w),
        CommonText(
          text: 'Distance : ${jobDetails.distance}',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
