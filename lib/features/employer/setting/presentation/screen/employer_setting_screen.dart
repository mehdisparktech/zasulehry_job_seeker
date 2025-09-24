import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/glass_effect_icon.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import '../../../../../core/config/route/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/employer_setting_controller.dart';
import '../../../../../core/constants/app_string.dart';
import '../widgets/employer_setting_item.dart';

class EmployerSettingScreen extends StatelessWidget {
  const EmployerSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    Get.put(EmployerSettingController());

    return Scaffold(
      /// App Bar Section starts here
      appBar: CommonAppBar(
        title: AppString.settings,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.deviceManagementSettings);
              },
              child: GlassEffectIcon(
                icon: AppImages.mobile,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),

      /// Body Section starts here
      body: GetBuilder<EmployerSettingController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  // 2 step verification item
                  InkWell(
                    onTap: () =>
                        Get.toNamed(AppRoutes.employerTwoStepVerification),
                    child: const SettingItem(
                      title: AppString.twoStepVerification,
                      iconDate: Icons.security,
                    ),
                  ),

                  /// Language Item
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.languageSelection),
                    child: const SettingItem(
                      title: AppString.language,
                      iconDate: Icons.language,
                    ),
                  ),

                  /// Country Item
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.countrySelection),
                    child: const SettingItem(
                      title: AppString.country,
                      iconDate: Icons.location_on_outlined,
                    ),
                  ),

                  /// Change Password Item
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.changePassword),
                    child: const SettingItem(
                      title: AppString.changePassword,
                      iconDate: Icons.lock_outline,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
