import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/services/storage/storage_keys.dart';
import '../../../../../core/config/route/app_routes.dart';
import '../../../../../core/component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/other_widgets/item.dart';
import '../../../../../core/component/pop_up/common_pop_menu.dart';
import '../../../../../core/component/text/common_text.dart';
import '../controller/profile_controller.dart';
import '../../../../../core/utils/constants/app_images.dart';
import '../../../../../core/utils/constants/app_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section Starts here
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: AppString.profile,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),

      /// Body Section Starts here
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                children: [
                  /// User Profile Image here
                  Center(
                    child: CircleAvatar(
                      radius: 85.sp,
                      backgroundColor: Colors.transparent,
                      child: const ClipOval(
                        child: CommonImage(
                          imageSrc: AppImages.profile,
                          size: 170,
                          defaultImage: AppImages.profile,
                        ),
                      ),
                    ),
                  ),

                  /// User Name here
                  const CommonText(
                    text: LocalStorageKeys.myName,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    top: 20,
                    bottom: 24,
                  ),

                  /// Edit Profile item here
                  Item(
                    icon: Icons.person,
                    title: AppString.editProfile,
                    onTap: () => Get.toNamed(AppRoutes.editProfile),
                  ),

                  /// Setting item here
                  Item(
                    icon: Icons.settings,
                    title: AppString.settings,
                    onTap: () => Get.toNamed(AppRoutes.setting),
                  ),

                  /// Change password Item here
                  Item(
                    title: AppString.changePassword,
                    iconDate: Icons.lock_outline,
                    onTap: () => Get.toNamed(AppRoutes.changePassword),
                  ),

                  /// Terms of Service Item here
                  Item(
                    title: AppString.termsOfServices,
                    iconDate: Icons.gavel,
                    onTap: () => Get.toNamed(AppRoutes.termsOfServices),
                  ),

                  /// Privacy Policy Item here
                  Item(
                    onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
                    title: AppString.privacyPolicy,
                    icon: Icons.network_wifi_1_bar,
                  ),

                  /// Delete Account Item here
                  Item(
                    title: AppString.deleteAccount,
                    iconDate: Icons.delete_outline_rounded,
                    onTap: () => deletePopUp(
                      controller: controller.passwordController,
                      onTap: controller.deleteAccountRepo,
                      isLoading: controller.isLoading,
                    ),
                  ),
                  Item(
                    icon: Icons.language,
                    title: AppString.language,
                    onTap: logOutPopUp,
                  ),

                  /// Log Out item here
                  Item(
                    icon: Icons.logout,
                    title: AppString.logOut,
                    onTap: logOutPopUp,
                  ),
                ],
              ),
            ),
          );
        },
      ),

      /// Bottom Navigation Bar Section Starts here
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 3),
    );
  }
}
