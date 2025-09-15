import 'package:flutter/material.dart';
import '../../../../../../utils/helpers/other_helper.dart';
import '../../../../../../utils/constants/app_string.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../controller/sign_up_controller.dart';

class SignUpAllField extends StatelessWidget {
  const SignUpAllField({super.key, required this.controller});

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        /// User Name here
        CommonTextField(
          hintText: AppString.fullName,
          controller: controller.nameController,
          validator: OtherHelper.validator,
        ),

        /// User location here
        CommonTextField(
          controller: controller.location,
          hintText: AppString.location,
          validator: OtherHelper.validator,
        ),

        /// User Email here
        CommonTextField(
          controller: controller.emailController,
          hintText: AppString.email,
          validator: OtherHelper.emailValidator,
        ),

        /// User Password here
        CommonTextField(
          controller: controller.passwordController,
          isPassword: true,
          hintText: AppString.password,
          validator: OtherHelper.passwordValidator,
        ),

        /// User Confirm Password here
        CommonTextField(
          controller: controller.confirmPasswordController,
          isPassword: true,
          hintText: AppString.confirmPassword,
          validator: (value) => OtherHelper.confirmPasswordValidator(
            value,
            controller.passwordController,
          ),
        ),
      ],
    );
  }
}
