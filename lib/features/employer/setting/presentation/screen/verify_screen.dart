import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/features/common/auth/forgot%20password/presentation/controller/forget_password_controller.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/constants/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../core/constants/app_string.dart';

class TwoStepVerificationVerifyScreen extends StatefulWidget {
  const TwoStepVerificationVerifyScreen({super.key});

  @override
  State<TwoStepVerificationVerifyScreen> createState() =>
      _TwoStepVerificationVerifyScreen();
}

class _TwoStepVerificationVerifyScreen
    extends State<TwoStepVerificationVerifyScreen> {
  final formKey = GlobalKey<FormState>();

  /// init State here
  @override
  void initState() {
    ForgetPasswordController.instance.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section
      appBar: CommonAppBar(title: "2 Factor Authentication"),

      /// Body Section
      body: GetBuilder<ForgetPasswordController>(
        builder: (controller) => Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CommonText(
                      text: AppString.verifyotp,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      bottom: 10,
                    ),

                    /// instruction how to get OTP
                    CommonText(
                      text: "${AppString.codeHasBeenSendTo} Phone Number",
                      fontSize: 12,
                      bottom: 20,
                      maxLines: 2,
                      color: AppColors.textSecondary,
                    ),

                    /// OTP Filed here
                    Flexible(
                      flex: 0,
                      child: PinCodeTextField(
                        controller: controller.otpController,
                        validator: (value) {
                          if (value != null && value.length == 6) {
                            return null;
                          } else {
                            return AppString.otpIsInValid;
                          }
                        },
                        autoDisposeControllers: false,
                        cursorColor: AppColors.black,
                        textStyle: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue500,
                        ),
                        appContext: (context),
                        autoFocus: true,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(24),
                          fieldHeight: 50.h,
                          fieldWidth: 50.w,
                          activeFillColor: AppColors.transparent,
                          selectedFillColor: AppColors.transparent,
                          inactiveFillColor: AppColors.transparent,
                          borderWidth: 0.5.w,
                          selectedColor: AppColors.primaryColor,
                          activeColor: AppColors.primaryColor,
                          inactiveColor: AppColors.black,
                        ),
                        length: 6,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.disabled,
                        enableActiveFill: true,
                      ),
                    ),

                    /// Resent OTP or show Timer
                    GestureDetector(
                      onTap: controller.time == '00:00'
                          ? () {
                              controller.startTimer();
                              controller.forgotPasswordRepo();
                            }
                          : () {},
                      child: CommonText(
                        text: controller.time == '00:00'
                            ? AppString.resendCode
                            : "${AppString.resendCodeIn} ${controller.time} ${AppString.minute}",
                        top: 20,
                        bottom: 20,
                        fontSize: 18,
                      ),
                    ),

                    ///  Submit Button here
                    CommonButton(
                      titleText: AppString.continues,
                      isLoading: controller.isLoadingVerify,
                      onTap: () {
                        // if (formKey.currentState!.validate()) {
                        //   controller.verifyOtpRepo();
                        // }
                      },
                      titleSize: 22.sp,
                      titleWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
