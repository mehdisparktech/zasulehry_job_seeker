import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
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
        Icon(Icons.business, color: AppColors.black, size: 24.sp),
        SizedBox(width: 16.w),
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
    return CommonText(
      text: jobDetails.jobTitle,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.blue500,
      textAlign: TextAlign.left,
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
        Icon(Icons.location_on_outlined, size: 16.sp),
        SizedBox(width: 6.w),
        CommonText(
          text: jobDetails.address,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.left,
          color: AppColors.textFiledColor,
        ),
      ],
    );
  }

  Widget _buildDateInfo() {
    return Row(
      children: [
        Icon(Icons.access_time_outlined, size: 16.sp),
        SizedBox(width: 6.w),
        CommonText(
          text: jobDetails.postedDate,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.left,
          color: AppColors.textFiledColor,
        ),
      ],
    );
  }

  Widget _buildDistanceRow() {
    return Row(
      children: [
        Icon(Icons.place_outlined, size: 16.sp),
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
