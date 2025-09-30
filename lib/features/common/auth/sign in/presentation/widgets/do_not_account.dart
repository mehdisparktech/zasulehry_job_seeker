import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/config/route/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_string.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppString.doNotHaveAccount,
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          /// Sign Up Button here
          TextSpan(
            text: AppString.signUp,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed(AppRoutes.selectRole);
              },
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
