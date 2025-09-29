import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../controller/sign_up_controller.dart';
import '../../../../../../core/constants/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../core/constants/app_string.dart';

class VerifyUser extends StatefulWidget {
  const VerifyUser({super.key});

  @override
  State<VerifyUser> createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    SignUpController.instance.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section starts here
      appBar: AppBar(),

      /// Body Section starts here
      body: GetBuilder<SignUpController>(
        builder: (controller) {
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 24.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      /// OTP Verification
                      CommonText(
                        text: AppString.verifyotp,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),

                      /// instruction how to get OTP
                      Center(
                        child: CommonText(
                          text:
                              "${AppString.codeHasBeenSendTo} ${controller.emailController.text}",
                          fontSize: 14.sp,
                          top: 10,
                          bottom: 20,
                          maxLines: 3,
                          color: AppColors.textSecondary,
                        ),
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
                            borderRadius: BorderRadius.circular(50.r),
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
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.disabled,
                          enableActiveFill: true,
                        ),
                      ),

                      /// Resent OTP or show Timer
                      GestureDetector(
                        onTap: controller.time == '00:00'
                            ? () {
                                controller.startTimer();
                                controller.signUpUser();
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
                        titleText: AppString.verify,
                        isLoading: controller.isLoadingVerify,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            controller.verifyOtpRepo();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
