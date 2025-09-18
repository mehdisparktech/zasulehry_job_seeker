import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/utils/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/utils/constants/app_images.dart';
import '../../../../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/component/button/common_button.dart';
import '../../../../../../core/component/text/common_text.dart';
import '../controller/sign_up_controller.dart';
import '../../../../../../core/utils/constants/app_string.dart';
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
      appBar: AppBar(title: CommonText(text: AppString.signUp)),

      /// Body Section Starts Here
      body: GetBuilder<SignUpController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: signUpFormKey,
              child: Column(
                children: [
                  /// Sign UP Instructions here
                  CommonImage(imageSrc: AppImages.noImage, size: 70),
                  10.height,
                  CommonText(
                    text: AppString.welcomeBack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue500,
                  ),
                  20.height,

                  /// All Text Filed here
                  SignUpAllField(controller: controller),
                  10.height,

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
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By signing up, you agree to our ",
                              style: TextStyle(color: AppColors.textFiledColor),
                            ),
                            TextSpan(
                              text: "Terms of Service",
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  16.height,

                  /// Submit Button Here
                  CommonButton(
                    titleText: AppString.signUp,
                    isLoading: controller.isLoading,
                    onTap: controller.signUpUser,
                  ),
                  24.height,

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
}
