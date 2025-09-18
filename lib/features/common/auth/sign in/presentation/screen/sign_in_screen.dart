import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/utils/constants/app_images.dart';
import '../../../../../../../../core/config/route/app_routes.dart';
import '../../../../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../../../../../../core/component/text_field/common_text_field.dart';
import '../controller/sign_in_controller.dart';

import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_string.dart';
import '../../../../../../core/utils/helpers/other_helper.dart';
import '../widgets/do_not_account.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      /// App Bar Sections Starts here
      appBar: AppBar(),

      /// Body Sections Starts here
      body: GetBuilder<SignInController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  /// Log In Instruction here
                  CommonImage(imageSrc: AppImages.noImage, size: 70).center,
                  10.height,
                  CommonText(
                    text: AppString.welcomeBack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue500,
                  ).center,
                  20.height,

                  /// Account Email Input here
                  CommonTextField(
                    controller: controller.emailController,
                    hintText: AppString.email,
                    validator: OtherHelper.emailValidator,
                  ),

                  /// Account Password Input here
                  CommonTextField(
                    controller: controller.passwordController,
                    isPassword: true,
                    hintText: AppString.password,
                    validator: OtherHelper.passwordValidator,
                  ),

                  /// Forget Password Button here
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                      child: const CommonText(
                        text: AppString.forgotThePassword,
                        top: 10,
                        bottom: 30,
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  /// Submit Button here
                  CommonButton(
                    titleText: AppString.logIn,
                    isLoading: controller.isLoading,
                    onTap: controller.signInUser,
                  ),
                  30.height,

                  /// Account Creating Instruction here
                  const DoNotHaveAccount().center,
                  30.height,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
