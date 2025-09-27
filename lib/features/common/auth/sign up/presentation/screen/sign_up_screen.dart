import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import '../../../../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../controller/sign_up_controller.dart';
import '../../../../../../core/constants/app_string.dart';
import '../widget/already_accunt_rich_text.dart';
import '../widget/sign_up_all_filed.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Sign Up Form Key
    final signUpFormKey = GlobalKey<FormState>();

    return Scaffold(
      /// App Bar Section Starts Here
      appBar: AppBar(
        title: CommonText(
          text: 'Sign Up',
          fontSize: 20.sp,
          color: Colors.black87,
        ),
      ),

      /// Body Section Starts Here
      body: GetBuilder<SignUpController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  /// Sign UP Instructions here
                  Center(
                    child: Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF083E4B),
                            Color(0xFF074E5E),
                            Color(0xFF0288A6),
                          ],
                          stops: [0.0, 0.4, 1.0],
                        ),
                      ),
                      child: Center(
                        child: CommonText(
                          text: 'P',
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  10.height,
                  CommonText(
                    text: AppString.welcomeBack,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue500,
                    fontStyle: FontStyle.italic,
                  ),
                  8.height,

                  /// All Text Filed here
                  SignUpAllField(controller: controller),

                  Row(
                    children: [
                      Checkbox(
                        value: controller.isTermsAndConditions,
                        onChanged: (value) {
                          controller.isTermsAndConditions = value ?? false;
                          controller.update();
                        },
                        activeColor: AppColors.blue500,
                        side: BorderSide(color: AppColors.primaryColor),
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "By Continuing, You Accept the ",
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "Privacy Policy ",
                                style: TextStyle(
                                  color: AppColors.blue500,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "And ",
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: "terms & conditions",
                                style: TextStyle(
                                  color: AppColors.blue500,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: " of JobsInApp.",
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  10.height,

                  /// Submit Button Here
                  CommonButton(
                    titleText: AppString.signUp,
                    isLoading: controller.isLoading,
                    onTap: controller.signUpUser,
                  ),

                  10.height,

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CommonText(
                      text: "Sign up with",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ).center,
                  10.height,

                  /// Social Icon here
                  _buildSocialIcon(),

                  10.height,

                  ///  Sign In Instruction here
                  const AlreadyAccountRichText(),
                  30.height,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSocialIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 12,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: CommonImage(imageSrc: AppImages.google, size: 24),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: CommonImage(imageSrc: AppImages.facebook, size: 24),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: CommonImage(imageSrc: AppImages.apple, size: 24),
        ),
      ],
    );
  }
}
