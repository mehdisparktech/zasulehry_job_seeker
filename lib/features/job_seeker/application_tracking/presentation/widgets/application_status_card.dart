import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';

class ApplicationStatusCard extends StatelessWidget {
  final Map application;
  final VoidCallback onTap;
  final VoidCallback? onWithdraw;
  final Color statusColor;

  const ApplicationStatusCard({
    super.key,
    required this.application,
    required this.onTap,
    this.onWithdraw,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
            /// Header Row
            Row(
              children: [
                /// Company Logo
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: const Icon(
                    Icons.business,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ),
                12.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: application['jobTitle'] ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                      ),
                      4.height,
                      CommonText(
                        text: application['company'] ?? '',
                        fontSize: 12,
                        color: AppColors.textFiledColor,
                      ),
                    ],
                  ),
                ),

                /// Status Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: CommonText(
                    text: application['status'] ?? '',
                    fontSize: 10,
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            12.height,

            /// Application Details
            Row(
              children: [
                _buildDetailItem(
                  Icons.confirmation_number_outlined,
                  application['applicationNumber'] ?? '',
                ),
                16.width,
                _buildDetailItem(
                  Icons.calendar_today_outlined,
                  "Applied: ${application['appliedDate'] ?? ''}",
                ),
              ],
            ),

            8.height,

            /// Job Details
            Row(
              children: [
                _buildDetailItem(
                  Icons.location_on_outlined,
                  application['location'] ?? '',
                ),
                16.width,
                _buildDetailItem(Icons.work_outline, application['type'] ?? ''),
              ],
            ),

            if (application['salary'] != null) ...[
              8.height,
              _buildDetailItem(Icons.payments_outlined, application['salary']),
            ],

            if (application['interviewDate'] != null) ...[
              12.height,
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.event, size: 16, color: Colors.purple),
                    8.width,
                    CommonText(
                      text: "Interview: ${application['interviewDate']}",
                      fontSize: 12,
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],

            if (application['nextStep'] != null) ...[
              12.height,
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_outline,
                      size: 16,
                      color: AppColors.primaryColor,
                    ),
                    8.width,
                    Expanded(
                      child: CommonText(
                        text: "Next: ${application['nextStep']}",
                        fontSize: 12,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            16.height,

            /// Action Row
            Row(
              children: [
                Expanded(
                  child: CommonText(
                    text: "Updated: ${application['lastUpdated'] ?? ''}",
                    fontSize: 10,
                    color: AppColors.textFiledColor,
                  ),
                ),
                if (onWithdraw != null)
                  TextButton(
                    onPressed: onWithdraw,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      minimumSize: Size.zero,
                    ),
                    child: const CommonText(
                      text: "Withdraw",
                      fontSize: 10,
                      color: Colors.red,
                    ),
                  ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12.sp,
                  color: AppColors.textFiledColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12.sp, color: AppColors.textFiledColor),
        4.width,
        CommonText(text: text, fontSize: 10, color: AppColors.textFiledColor),
      ],
    );
  }
}
