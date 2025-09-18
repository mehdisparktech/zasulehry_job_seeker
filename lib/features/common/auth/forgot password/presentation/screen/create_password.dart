import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import '../../../../../../core/utils/extensions/extension.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../controller/forget_password_controller.dart';
import '../../../../../../core/constants/app_string.dart';
import '../../../../../../core/utils/helpers/other_helper.dart';

class CreatePassword extends StatelessWidget {
  CreatePassword({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section starts here
      appBar: AppBar(
        title: const CommonText(
          text: AppString.createNewPassword,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),

      /// Body Section starts here
      body: GetBuilder<ForgetPasswordController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
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
                    /// Instruction of Creating New Password
                    const CommonText(
                      text: AppString.createYourNewPassword,
                      fontSize: 18,
                      textAlign: TextAlign.start,
                      bottom: 24,
                    ).center,

                    /// New Password here
                    const CommonText(text: AppString.password, bottom: 8),
                    CommonTextField(
                      controller: controller.passwordController,
                      prefixIcon: const Icon(Icons.lock),
                      hintText: AppString.password,
                      isPassword: true,
                      validator: OtherHelper.passwordValidator,
                    ),

                    /// Confirm Password here
                    const CommonText(
                      text: AppString.password,
                      bottom: 8,
                      top: 12,
                    ),
                    CommonTextField(
                      controller: controller.confirmPasswordController,
                      prefixIcon: const Icon(Icons.lock),
                      hintText: AppString.confirmPassword,
                      validator: (value) =>
                          OtherHelper.confirmPasswordValidator(
                            value,
                            controller.passwordController,
                          ),
                      isPassword: true,
                    ),
                    64.height,

                    /// Submit Button here
                    CommonButton(
                      titleText: AppString.continues,
                      isLoading: controller.isLoadingReset,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.resetPasswordRepo();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
