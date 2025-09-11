import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../component/text/common_text.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.title, required this.iconDate});

  final String title;
  final IconData iconDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF083E4B), Color(0xFF074E5E), Color(0xFF0288A6)],
          stops: [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          /// show icon here
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(iconDate, color: AppColors.white),
          ),

          /// show Title here
          CommonText(text: title, color: AppColors.white, left: 12),
          const Spacer(),

          /// show Icon here
          const Icon(Icons.arrow_forward_ios, color: AppColors.white),
        ],
      ),
    );
  }
}
