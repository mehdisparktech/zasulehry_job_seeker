import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/config/route/app_routes.dart';
import '../../../../../core/component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/other_widgets/item.dart';
import '../../../../../core/component/pop_up/common_pop_menu.dart';
import '../../../../../core/component/text/common_text.dart';
import '../controller/profile_controller.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/services/storage/storage_services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom gradient header inside body to match the design
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    // Header Section with gradient and rounded bottom corners
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(-0.9, 0),
                          end: Alignment(1.0, 0),
                          colors: [
                            Color(0xFF083E4B),
                            Color(0xFF074E5E),
                            Color(0xFF0288A6),
                          ],
                          stops: [0.0, 0.4, 1.0],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36.r),
                          bottomRight: Radius.circular(36.r),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 64),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CommonText(
                              text: AppString.profile,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            SizedBox(height: 64.h), // Space for avatar
                          ],
                        ),
                      ),
                    ),

                    // Name text with extra top padding to accommodate avatar
                    Padding(
                      padding: EdgeInsets.only(top: 64.h, bottom: 16.h),
                      child: CommonText(
                        text: (LocalStorage.myName.isNotEmpty
                            ? LocalStorage.myName
                            : "Example Name"),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blue500,
                      ),
                    ),

                    // Menu items
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          // Personal Information
                          Item(
                            icon: Icons.person,
                            title: AppString.personalInformation,
                            onTap: () => Get.toNamed(AppRoutes.editProfile),
                          ),

                          // Work Information
                          Item(
                            icon: Icons.work_outline,
                            title: AppString.workInformation,
                          ),

                          // Settings
                          Item(
                            icon: Icons.settings,
                            title: AppString.settings,
                            onTap: () => Get.toNamed(AppRoutes.setting),
                          ),

                          // Contact & Support
                          Item(
                            icon: Icons.contact_support,
                            title: AppString.contactAndSupport,
                          ),

                          // Share App
                          Item(icon: Icons.share, title: AppString.shareApp),

                          // Review
                          Item(
                            icon: Icons.star_rate_rounded,
                            title: AppString.review,
                          ),

                          // Log Out
                          Item(
                            icon: Icons.logout,
                            title: AppString.logOut,
                            onTap: logOutPopUp,
                          ),

                          // Delete Account
                          Item(
                            title: AppString.deleteAccount,
                            icon: Icons.delete_outline_rounded,
                            onTap: () => deletePopUp(
                              controller: controller.passwordController,
                              onTap: controller.deleteAccountRepo,
                              isLoading: controller.isLoading,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),

                // Positioned CircleAvatar to overlap header container
                Positioned(
                  top: 140.h, // Adjust this value to position avatar correctly
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 52.r,
                      child: const ClipOval(
                        child: CommonImage(
                          imageSrc: AppImages.profile,
                          size: 125,
                          defaultImage: AppImages.profile,
                          fill: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      // Bottom Navigation Bar Section
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 3),
    );
  }
}
