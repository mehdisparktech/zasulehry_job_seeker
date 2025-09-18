import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import '../../../../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../controller/forget_password_controller.dart';
import '../../../../../../core/constants/app_string.dart';
import '../../../../../../core/utils/helpers/other_helper.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) => Scaffold(
        /// App Bar Section
        appBar: AppBar(elevation: 0),

        /// body section
        body: Center(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CommonText(
                      text: AppString.forgotPassword,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      top: 10,
                    ).center,
                    const CommonText(
                      text: AppString.forgotPasswordSubtitle,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.textFiledColor,
                      bottom: 8,
                      top: 4,
                    ).center,

                    /// forget password take email for reset Password
                    const CommonText(text: AppString.email, bottom: 8, top: 10),
                    CommonTextField(
                      controller: controller.emailController,
                      prefixIcon: const Icon(Icons.mail),
                      hintText: AppString.email,
                      validator: OtherHelper.emailValidator,
                    ),
                    20.height,
                    CommonButton(
                      titleText: AppString.continues,
                      isLoading: controller.isLoadingEmail,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.forgotPasswordRepo();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        /// Bottom Navigation Bar Section
      ),
    );
  }
}
