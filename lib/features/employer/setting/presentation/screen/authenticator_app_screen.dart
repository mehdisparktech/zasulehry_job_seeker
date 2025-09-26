import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../core/constants/app_colors.dart';

class AuthenticatorAppScreen extends StatefulWidget {
  const AuthenticatorAppScreen({super.key});

  @override
  State<AuthenticatorAppScreen> createState() => _AuthenticatorAppScreenState();
}

class _AuthenticatorAppScreenState extends State<AuthenticatorAppScreen> {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: "Authenticator App"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            CommonText(
              text: "Set Your Authentication App",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              textAlign: TextAlign.left,
            ),

            SizedBox(height: 12.h),

            CommonText(
              text:
                  "Authenticator App provides you a Security Code,with that Code you can secure your Account.",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              textAlign: TextAlign.left,
              maxLines: 3,
            ),

            SizedBox(height: 24.h),

            // Step 1
            _buildStepSection(
              "1. Step One",
              "Please Download Authenticator App Like Google Authenticator Or Microsoft Authenticator.",
            ),

            SizedBox(height: 20.h),

            // Step 2
            _buildStepSection(
              "2. Step Two",
              "Please Open Authenticator App And Scan This QR Code.",
            ),

            SizedBox(height: 20.h),

            // QR Code Section
            Center(
              child: Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppColors.textFiledColor.withOpacity(0.3),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.qr_code,
                    size: 120.w,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            // Step 3
            _buildStepSection(
              "3. Step 3 : Enter Code",
              "Please Enter The Code From Your Athuntificator App To Complete This Verification.",
            ),

            SizedBox(height: 20.h),

            // Enter Code Section
            CommonText(
              text: "Enter Code",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              textAlign: TextAlign.left,
            ),

            SizedBox(height: 12.h),

            CommonTextField(
              controller: codeController,
              hintText: "Enter Your Code",
              keyboardType: TextInputType.number,
              borderRadius: 8,
            ),

            SizedBox(height: 40.h),

            // Confirm Button
            CommonButton(
              titleText: "Confirm",
              onTap: () {
                if (codeController.text.isNotEmpty) {
                  // Handle confirmation logic
                  Get.back();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepSection(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: title,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8.h),
        CommonText(
          text: description,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          textAlign: TextAlign.left,
          maxLines: 3,
        ),
      ],
    );
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }
}
