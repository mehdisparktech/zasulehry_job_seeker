import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import '../../../../../core/component/other_widgets/common_loader.dart';
import '../../../../../core/component/screen/error_screen.dart';
import '../controller/privacy_policy_controller.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/utils/enum/enum.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section stats here
      appBar: CommonAppBar(title: AppString.privacyPolicy),

      /// Body Section stats here
      body: SafeArea(
        child: GetBuilder<PrivacyPolicyController>(
          builder: (controller) => switch (controller.status) {
          /// Loading bar here
          Status.loading => const CommonLoader(),

          /// Error Handle here
          Status.error => ErrorScreen(
            onTap: PrivacyPolicyController.instance.getPrivacyPolicyRepo(),
          ),

          /// Show main data here
          Status.completed => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Html(data: controller.data.content),
          ),
        },
        ),
      ),
      bottomSheet: Container(
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.only(left: 250.0, right: 8.0, bottom: 40.0),
          child: CommonButton(titleText: "Download Pdf.", onTap: () {}),
        ),
      ),
    );
  }
}
