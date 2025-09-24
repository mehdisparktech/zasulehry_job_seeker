import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/glass_effect_icon.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import '../../../../../core/config/route/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/setting_controller.dart';
import '../../../../../core/constants/app_string.dart';
import '../widgets/setting_item.dart';
import '../widgets/profile_visibility_option.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section starts here
      appBar: CommonAppBar(
        title: AppString.settings,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GlassEffectIcon(
              icon: AppImages.phone,
              width: 24.w,
              height: 24.h,
              onTap: () => Get.toNamed(AppRoutes.deviceManagementSettings),
            ),
          ),
        ],
      ),

      /// Body Section starts here
      body: GetBuilder<SettingController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
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

                  /// Connected Accounts Item
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.connectedAccounts),
                    child: const SettingItem(
                      title: AppString.connectedAccounts,
                      iconDate: Icons.account_circle_outlined,
                    ),
                  ),

                  /// Privacy Policy Item
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
                    child: const SettingItem(
                      title: AppString.privacyPolicy,
                      iconDate: Icons.privacy_tip_outlined,
                    ),
                  ),

                  /// Terms & Condition Item
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.termsOfServices),
                    child: const SettingItem(
                      title: AppString.termsOfServices,
                      iconDate: Icons.description_outlined,
                    ),
                  ),

                  /// Impressum Item
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.impressum),
                    child: const SettingItem(
                      title: AppString.impressum,
                      iconDate: Icons.info_outline,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// Profile Visibility Section
                  ProfileVisibilityOption(
                    title: AppString.employersCanSeeYourProfile,
                    description:
                        AppString.onJobsinAppPlatformWeTryToHideIdentityDetails,
                    isSelected: true,
                    onTap: () {
                      // Handle profile visibility selection
                    },
                  ),

                  ProfileVisibilityOption(
                    title: AppString.employersCannotSeeYourProfile,
                    description:
                        AppString.theEmployersYouHaveAppliedToCanSeeYourProfile,
                    isSelected: false,
                    onTap: () {
                      // Handle profile visibility selection
                    },
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
