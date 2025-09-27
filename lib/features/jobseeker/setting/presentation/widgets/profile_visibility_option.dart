import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/constants/app_colors.dart';

class ProfileVisibilityOption extends StatelessWidget {
  const ProfileVisibilityOption({
    super.key,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.isVisiable,
    this.onTap,
  });

  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isVisiable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor, width: 2),
              color: AppColors.transparent,
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.transparent,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.blue500, width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    isVisiable ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black87,
                    size: 24.sp,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: title,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4.h),
                        CommonText(
                          text: description,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          textAlign: TextAlign.left,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
