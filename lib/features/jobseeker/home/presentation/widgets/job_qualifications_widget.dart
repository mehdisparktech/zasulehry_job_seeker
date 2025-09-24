import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';

class JobQualificationsWidget extends StatelessWidget {
  final List<String> qualifications;

  const JobQualificationsWidget({super.key, required this.qualifications});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Qualifications',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        ...qualifications.map(
          (qualification) => _buildBulletPoint(qualification),
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
