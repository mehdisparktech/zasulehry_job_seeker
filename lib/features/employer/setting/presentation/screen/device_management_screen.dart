import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';

class DeviceManagementScreen extends StatelessWidget {
  const DeviceManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.deviceManagement),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title section
              CommonText(
                text: "You Are At This Device For Your\nAccount Logged In.",
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                textAlign: TextAlign.left,
                maxLines: 2,
                top: 20,
                bottom: 30,
              ),

              // Device information cards
              _buildInfoCard("Device :", "Apple Ios"),
              SizedBox(height: 15.h),
              _buildInfoCard("Log In Date :", "01.02.2025"),
              SizedBox(height: 15.h),
              _buildInfoCard("IP Address :", "2533256536"),
              SizedBox(height: 15.h),
              _buildInfoCard("City :", "Dhaka"),

              SizedBox(height: 40.h),

              // Action section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: "Action",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                    textAlign: TextAlign.left,
                  ),
                  CommonButton(
                    titleText: "Log Out",
                    buttonColor: AppColors.red2,
                    titleColor: AppColors.white,
                    borderColor: AppColors.red2,
                    buttonWidth: 130.w,
                    buttonHeight: 50.h,
                    buttonRadius: 8,
                    isGradient: false,
                    onTap: () {
                      // Handle log out action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.blue500, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: label,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            textAlign: TextAlign.left,
          ),
          CommonText(
            text: value,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
