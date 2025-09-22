import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/constants/app_colors.dart';
import 'authenticator_app_screen.dart';
import '../widgets/sms_verification_popup.dart';

class TwoStepVerificationScreen extends StatefulWidget {
  const TwoStepVerificationScreen({super.key});

  @override
  State<TwoStepVerificationScreen> createState() =>
      _TwoStepVerificationScreenState();
}

class _TwoStepVerificationScreenState extends State<TwoStepVerificationScreen> {
  RxBool isOnlineEnabled = true.obs;
  RxBool isOfflineEnabled = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(title: "2 Factor Authentication"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Security Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
              child: CommonText(
                text: "Account Security",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: 16.h),

            // SMS Button
            Container(
              width: double.infinity,
              height: 50.h,
              margin: EdgeInsets.only(bottom: 12.h),
              child: ElevatedButton(
                onPressed: () {
                  _showSmsVerificationPopup();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.transparent,
                  foregroundColor: AppColors.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    side: BorderSide(color: AppColors.primaryColor, width: 2),
                  ),
                ),
                child: CommonText(
                  text: "Sms",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
            ),

            // Authenticator App Button
            Container(
              width: double.infinity,
              height: 50.h,
              margin: EdgeInsets.only(bottom: 24.h),
              child: ElevatedButton(
                onPressed: () {
                  _navigateToAuthenticatorApp();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.transparent,
                  foregroundColor: AppColors.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    side: BorderSide(color: AppColors.primaryColor, width: 2),
                  ),
                ),
                child: CommonText(
                  text: "Authenticator App",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
            ),

            // Online/Offline Toggle Section
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CommonText(
                        text: "Online",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      SizedBox(width: 12.w),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            isOnlineEnabled.value = true;
                            isOfflineEnabled.value = false;
                          },
                          child: Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isOnlineEnabled.value
                                  ? AppColors.primaryColor
                                  : AppColors.textFiledColor.withOpacity(0.3),
                            ),
                            child: isOnlineEnabled.value
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.white,
                                    size: 16.w,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CommonText(
                        text: "Offline",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      SizedBox(width: 12.w),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            isOfflineEnabled.value = true;
                            isOnlineEnabled.value = false;
                          },
                          child: Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isOfflineEnabled.value
                                  ? AppColors.primaryColor
                                  : AppColors.textFiledColor.withOpacity(0.3),
                            ),
                            child: isOfflineEnabled.value
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.white,
                                    size: 16.w,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 40.h),

            // Third Party Apps Section
            Row(
              children: [
                Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryColor, width: 2),
                  ),
                  child: Center(
                    child: CommonText(
                      text: "i",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CommonText(
                    text: "Third Party Apps",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: CommonText(
                text: "Third Party Apps Dont Have Control Of Your Account",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textFiledColor,
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAuthenticatorApp() {
    Get.to(() => const AuthenticatorAppScreen());
  }

  void _showSmsVerificationPopup() {
    showDialog(
      context: context,
      builder: (context) => const SmsVerificationPopup(),
    );
  }
}
