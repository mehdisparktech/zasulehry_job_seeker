import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/button/common_button.dart';
import '../../../../utils/constants/app_colors.dart';

class JobCard extends StatelessWidget {
  final Map job;
  final VoidCallback onApply;
  final VoidCallback onSave;
  final VoidCallback onTap;

  const JobCard({
    super.key,
    required this.job,
    required this.onApply,
    required this.onSave,
    required this.onTap,
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
                        text: job['company'] ?? '',
                        fontSize: 14,
                        color: AppColors.textFiledColor,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onSave,
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: AppColors.textFiledColor,
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

            16.height,

            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    titleText: "Apply Now",
                    onTap: onApply,
                    buttonHeight: 36,
                    titleColor: AppColors.white,
                    buttonColor: AppColors.primaryColor,
                  ),
                ),
                12.width,
                CommonText(
                  text: job['posted'] ?? '',
                  fontSize: 12,
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
