import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';

class JobDescriptionWidget extends StatelessWidget {
  final String description;

  const JobDescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Job Description',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        CommonText(
          text: description,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
          textAlign: TextAlign.left,
          maxLines: 10,
        ),
      ],
    );
  }
}
