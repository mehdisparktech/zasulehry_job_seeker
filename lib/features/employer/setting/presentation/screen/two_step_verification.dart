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
      body: SafeArea(
        child: SingleChildScrollView(
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
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      child: Row(
                        children: [
                          Switch(
                            value: isOnlineEnabled.value,
                            onChanged: (value) {
                              isOnlineEnabled.value = value;
                            },
                            activeColor: AppColors.primaryColor,
                            activeTrackColor: AppColors.activeTrackColor,
                            inactiveThumbColor: AppColors.primaryColor,
                            inactiveTrackColor: AppColors.activeTrackColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          SizedBox(width: 12.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Active",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.backgroundGradient2,
                              ),
                              CommonText(
                                text: "01324567890",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.backgroundGradient2,
                              ),
                            ],
                          ),
                          SizedBox(width: 12.w),
                          // Obx(
                          //   () => GestureDetector(
                          //     onTap: () {
                          //       isOnlineEnabled.value = true;
                          //       isOfflineEnabled.value = false;
                          //     },
                          //     child: Container(
                          //       width: 24.w,
                          //       height: 24.w,
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: isOnlineEnabled.value
                          //             ? AppColors.primaryColor
                          //             : AppColors.textFiledColor.withOpacity(0.3),
                          //       ),
                          //       child: isOnlineEnabled.value
                          //           ? Icon(
                          //               Icons.check,
                          //               color: AppColors.white,
                          //               size: 16.w,
                          //             )
                          //           : null,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                child: Row(
                  children: [
                    Switch(
                      value: isOfflineEnabled.value,
                      onChanged: (value) {
                        isOfflineEnabled.value = value;
                      },
                      activeColor: AppColors.primaryColor,
                      activeTrackColor: AppColors.activeTrackColor,
                      inactiveThumbColor: AppColors.blue200,
                      inactiveTrackColor: AppColors.activeTrackColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Inactive",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.backgroundGradient2,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          CommonText(
                            text: "Google Authenticator App",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.backgroundGradient2,
                          ),
                          SizedBox(width: 12.w),
                          // Obx(
                          //   () => GestureDetector(
                          //     onTap: () {
                          //       isOfflineEnabled.value = true;
                          //       isOnlineEnabled.value = false;
                          //     },
                          //     child: Container(
                          //       width: 24.w,
                          //       height: 24.w,
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: isOfflineEnabled.value
                          //             ? AppColors.primaryColor
                          //             : AppColors.textFiledColor.withOpacity(0.3),
                          //       ),
                          //       child: isOfflineEnabled.value
                          //           ? Icon(
                          //               Icons.check,
                          //               color: AppColors.white,
                          //               size: 16.w,
                          //             )
                          //           : null,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
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
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.backgroundGradient2,
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
