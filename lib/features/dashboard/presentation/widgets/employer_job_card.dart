import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_colors.dart';

class EmployerJobCard extends StatelessWidget {
  final Map job;
  final VoidCallback onViewApplications;
  final VoidCallback onEdit;

  const EmployerJobCard({
    super.key,
    required this.job,
    required this.onViewApplications,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: job['title'] ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    4.height,
                    CommonText(
                      text: job['department'] ?? '',
                      fontSize: 14,
                      color: AppColors.textFiledColor,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: job['status'] == 'Active'
                      ? Colors.green.withOpacity(0.1)
                      : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: CommonText(
                  text: job['status'] ?? '',
                  fontSize: 12,
                  color: job['status'] == 'Active'
                      ? Colors.green
                      : Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          12.height,

          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16.sp,
                color: AppColors.textFiledColor,
              ),
              4.width,
              CommonText(
                text: job['location'] ?? '',
                fontSize: 12,
                color: AppColors.textFiledColor,
              ),
              16.width,
              Icon(
                Icons.work_outline,
                size: 16.sp,
                color: AppColors.textFiledColor,
              ),
              4.width,
              CommonText(
                text: job['type'] ?? '',
                fontSize: 12,
                color: AppColors.textFiledColor,
              ),
            ],
          ),

          8.height,

          if (job['salary'] != null)
            Row(
              children: [
                Icon(
                  Icons.payments_outlined,
                  size: 16.sp,
                  color: AppColors.primaryColor,
                ),
                4.width,
                CommonText(
                  text: job['salary'],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ],
            ),

          12.height,

          Row(
            children: [
              Icon(
                Icons.people_outline,
                size: 16.sp,
                color: AppColors.textFiledColor,
              ),
              4.width,
              CommonText(
                text: "${job['applicants'] ?? 0} applicants",
                fontSize: 12,
                color: AppColors.textFiledColor,
              ),
              const Spacer(),
              CommonText(
                text: job['posted'] ?? '',
                fontSize: 12,
                color: AppColors.textFiledColor,
              ),
            ],
          ),

          16.height,

          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onViewApplications,
                  child: Container(
                    height: 36.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: const CommonText(
                      text: "View Applications",
                      fontSize: 14,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              12.width,
              InkWell(
                onTap: onEdit,
                child: Container(
                  height: 36.h,
                  width: 36.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.filledColor,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: AppColors.textFiledColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension SpaceExtension on num {
  Widget get verticalSpace => SizedBox(height: toDouble().h);
  Widget get horizontalSpace => SizedBox(width: toDouble().w);
}
