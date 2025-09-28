import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/features/employer/setting/presentation/screen/verify_screen.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../core/constants/app_colors.dart';

class SmsVerificationPopup extends StatefulWidget {
  const SmsVerificationPopup({super.key});

  @override
  State<SmsVerificationPopup> createState() => _SmsVerificationPopupState();
}

class _SmsVerificationPopupState extends State<SmsVerificationPopup> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: "SMS Verification",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    color: AppColors.textFiledColor,
                    size: 24.w,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Description
            CommonText(
              text: "Enter your phone number to receive SMS verification code",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textFiledColor,
              textAlign: TextAlign.left,
              maxLines: 2,
            ),

            SizedBox(height: 20.h),

            // Phone Number Label
            CommonText(
              text: "Phone Number",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              textAlign: TextAlign.left,
            ),

            SizedBox(height: 12.h),

            // Phone Number Input
            CommonTextField(
              controller: phoneController,
              hintText: "Enter your phone number",
              keyboardType: TextInputType.phone,
              borderRadius: 8,
            ),

            SizedBox(height: 30.h),

            // Continue Button
            CommonButton(
              titleText: "Continue",
              onTap: () {
                if (phoneController.text.isNotEmpty) {
                  // Handle SMS verification logic
                  Get.to(() => const TwoStepVerificationVerifyScreen());
                  // You can add navigation to OTP screen here
                  _showSuccessMessage();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessMessage() {
    Get.snackbar(
      "SMS Sent",
      "Verification code has been sent to ${phoneController.text}",
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
