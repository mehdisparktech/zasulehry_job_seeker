import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_colors.dart';

class ApplicationCard extends StatelessWidget {
  final Map application;
  final VoidCallback onTap;

  const ApplicationCard({
    super.key,
    required this.application,
    required this.onTap,
  });

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'new':
        return Colors.blue;
      case 'reviewed':
        return Colors.orange;
      case 'interview scheduled':
        return Colors.green;
      case 'hired':
        return Colors.purple;
      case 'rejected':
        return Colors.red;
      default:
        return AppColors.textFiledColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.filledColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                  child: CommonText(
                    text: application['candidateName']?.substring(0, 1) ?? 'U',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                12.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: application['candidateName'] ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      4.height,
                      CommonText(
                        text: application['jobTitle'] ?? '',
                        fontSize: 12,
                        color: AppColors.textFiledColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _getStatusColor(
                      application['status'] ?? '',
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: CommonText(
                    text: application['status'] ?? '',
                    fontSize: 10,
                    color: _getStatusColor(application['status'] ?? ''),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            12.height,

            Row(
              children: [
                Icon(
                  Icons.work_outline,
                  size: 14.sp,
                  color: AppColors.textFiledColor,
                ),
                4.width,
                CommonText(
                  text: "${application['experience'] ?? ''} experience",
                  fontSize: 12,
                  color: AppColors.textFiledColor,
                ),
                16.width,
                Icon(
                  Icons.location_on_outlined,
                  size: 14.sp,
                  color: AppColors.textFiledColor,
                ),
                4.width,
                CommonText(
                  text: application['location'] ?? '',
                  fontSize: 12,
                  color: AppColors.textFiledColor,
                ),
              ],
            ),

            8.height,

            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 14.sp,
                  color: AppColors.textFiledColor,
                ),
                4.width,
                CommonText(
                  text: "Applied on ${application['appliedDate'] ?? ''}",
                  fontSize: 12,
                  color: AppColors.textFiledColor,
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColors.textFiledColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension SpaceExtension on num {
  Widget get verticalSpace => SizedBox(height: toDouble().h);
  Widget get horizontalSpace => SizedBox(width: toDouble().w);
}
