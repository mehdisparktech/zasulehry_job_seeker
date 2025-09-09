import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../utils/constants/app_colors.dart';

class JobSearchCard extends StatelessWidget {
  final Map job;
  final VoidCallback onApply;
  final VoidCallback onSave;
  final VoidCallback onTap;
  final bool isSaved;

  const JobSearchCard({
    super.key,
    required this.job,
    required this.onApply,
    required this.onSave,
    required this.onTap,
    required this.isSaved,
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
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: const Icon(
                    Icons.business,
                    color: AppColors.primaryColor,
                  ),
                ),
                12.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: job['title'] ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        maxLines: 2,
                      ),
                      4.height,
                      CommonText(
                        text: job['company'] ?? '',
                        fontSize: 14,
                        color: AppColors.textFiledColor,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onSave,
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: isSaved
                        ? AppColors.primaryColor
                        : AppColors.textFiledColor,
                  ),
                ),
              ],
            ),

            12.height,

            /// Job Details Row 1
            Row(
              children: [
                _buildDetailChip(
                  Icons.location_on_outlined,
                  job['location'] ?? '',
                ),
                8.width,
                _buildDetailChip(Icons.work_outline, job['type'] ?? ''),
              ],
            ),

            8.height,

            /// Job Details Row 2
            Row(
              children: [
                _buildDetailChip(Icons.trending_up, job['experience'] ?? ''),
                8.width,
                _buildDetailChip(
                  Icons.people_outline,
                  "${job['applicationCount'] ?? 0} applied",
                ),
              ],
            ),

            12.height,

            /// Salary
            if (job['salary'] != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: CommonText(
                  text: job['salary'],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),

            12.height,

            /// Skills Preview
            if (job['skills'] != null && job['skills'].isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonText(
                    text: "Skills:",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  4.height,
                  Wrap(
                    spacing: 4.w,
                    runSpacing: 4.h,
                    children: (job['skills'] as List).take(4).map((skill) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.filledColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: CommonText(
                          text: skill,
                          fontSize: 10,
                          color: AppColors.black,
                        ),
                      );
                    }).toList(),
                  ),
                  8.height,
                ],
              ),

            /// Description Preview
            CommonText(
              text: job['description'] ?? '',
              fontSize: 12,
              color: AppColors.textFiledColor,
              maxLines: 2,
            ),

            16.height,

            /// Action Row
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CommonButton(
                    titleText: "Apply Now",
                    onTap: onApply,
                    buttonHeight: 36,
                    titleColor: AppColors.white,
                    buttonColor: AppColors.primaryColor,
                    titleSize: 14,
                  ),
                ),
                12.width,
                Expanded(
                  child: Container(
                    height: 36.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.filledColor,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: CommonText(
                      text: job['posted'] ?? '',
                      fontSize: 12,
                      color: AppColors.textFiledColor,
                    ),
                  ),
                ),
              ],
            ),

            /// Deadline Warning
            if (job['deadline'] != null)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Row(
                  children: [
                    Icon(Icons.schedule, size: 12.sp, color: Colors.orange),
                    4.width,
                    CommonText(
                      text: "Deadline: ${job['deadline']}",
                      fontSize: 10,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailChip(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.sp, color: AppColors.textFiledColor),
        4.width,
        CommonText(text: text, fontSize: 12, color: AppColors.textFiledColor),
      ],
    );
  }
}
