import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import '../../../../../../core/utils/extensions/extension.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../controller/change_password_controller.dart';
import '../../../../../../core/constants/app_string.dart';
import '../../../../../../core/utils/helpers/other_helper.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.changePassword),
      body: GetBuilder<ChangePasswordController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              margin: EdgeInsets.only(top: 100.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    CommonText(
                      text: AppString.changePassword,
                      bottom: 8,
                      fontSize: 24,
                    ).center,

                    /// current Password section
                    CommonTextField(
                      controller: controller.currentPasswordController,
                      hintText: AppString.currentPassword,
                      validator: OtherHelper.passwordValidator,
                      isPassword: true,
                    ),

                    /// New Password section
                    CommonTextField(
                      controller: controller.newPasswordController,
                      hintText: AppString.newPassword,
                      validator: OtherHelper.passwordValidator,
                      isPassword: true,
                    ),

                    /// confirm Password section
                    CommonTextField(
                      controller: controller.confirmPasswordController,
                      hintText: AppString.confirmPassword,
                      validator: (value) =>
                          OtherHelper.confirmPasswordValidator(
                            value,
                            controller.newPasswordController,
                          ),
                      isPassword: true,
                    ),

                    /// submit Button
                    CommonButton(
                      titleText: AppString.confirm,
                      isLoading: controller.isLoading,
                      onTap: controller.changePasswordRepo,
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
