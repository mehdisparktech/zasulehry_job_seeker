import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';

class JobResponsibilitiesWidget extends StatelessWidget {
  final List<String> responsibilities;

  const JobResponsibilitiesWidget({super.key, required this.responsibilities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Responsibilities',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        ...responsibilities.map(
          (responsibility) => _buildBulletPoint(responsibility),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6.h),
            width: 6.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CommonText(
              text: text,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              textAlign: TextAlign.left,
              maxLines: 10,
            ),
          ),
        ],
      ),
    );
  }
}
