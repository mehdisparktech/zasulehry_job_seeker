import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/services/storage/storage_services.dart';
import 'package:zasulehry_job_seeker/core/utils/enum/enum.dart';
import '../../constants/app_colors.dart';
import '../../utils/log/app_log.dart';

class CommonBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CommonBottomNavBar({required this.currentIndex, super.key});

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  var bottomNavIndex = 0;

  // Jobseeker bottom nav bar icons
  List<Widget> jobseekerUnselectedIcons = [
    const Icon(Icons.home_outlined, color: AppColors.black),
    const Icon(Icons.dashboard_outlined, color: AppColors.black),
    const Icon(Icons.chat, color: AppColors.black),
    const Icon(Icons.person_2_outlined, color: AppColors.black),
  ];

  List<Widget> jobseekerSelectedIcons = [
    const Icon(Icons.home_outlined, color: AppColors.primaryColor),
    const Icon(Icons.dashboard_outlined, color: AppColors.primaryColor),
    const Icon(Icons.chat, color: AppColors.primaryColor),
    const Icon(Icons.person, color: AppColors.primaryColor),
  ];

  List<String> jobseekerText = ["Home", "Dashboard", "Chat", "Profile"];

  // Employer bottom nav bar icons

  List<Widget> employerUnselectedIcons = [
    const Icon(Icons.dashboard_outlined, color: AppColors.black),
    const Icon(Icons.chat, color: AppColors.black),
    const Icon(Icons.file_copy, color: AppColors.black),
    const Icon(Icons.person_2_outlined, color: AppColors.black),
  ];

  List<Widget> employerSelectedIcons = [
    const Icon(Icons.dashboard_outlined, color: AppColors.primaryColor),
    const Icon(Icons.chat, color: AppColors.primaryColor),
    const Icon(Icons.file_copy, color: AppColors.primaryColor),
    const Icon(Icons.person, color: AppColors.primaryColor),
  ];

  List<String> employerText = ["Dashboard", "Chat", "Invoice", "Profile"];

  List<Widget> get unselectedIcons =>
      LocalStorage.userRole == UserRole.jobSeeker
      ? jobseekerUnselectedIcons
      : employerUnselectedIcons;
  List<Widget> get selectedIcons => LocalStorage.userRole == UserRole.jobSeeker
      ? jobseekerSelectedIcons
      : employerSelectedIcons;
  List<String> get text => LocalStorage.userRole == UserRole.jobSeeker
      ? jobseekerText
      : employerText;

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(unselectedIcons.length, (index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: EdgeInsetsDirectional.all(12.sp),
                child: Column(
                  children: [
                    index == bottomNavIndex
                        ? selectedIcons[index]
                        : unselectedIcons[index],
                    CommonText(
                      text: text[index],
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: index == bottomNavIndex
                          ? AppColors.primaryColor
                          : AppColors.black,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void onTap(int index) async {
    appLog(widget.currentIndex, source: "common bottombar");

    if (index == 0) {
      if (!(widget.currentIndex == 0)) {
        LocalStorage.userRole == UserRole.jobSeeker
            ? Get.toNamed(AppRoutes.jobSeekerHome)
            : Get.toNamed(AppRoutes.employerDashboard);
      }
    } else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        LocalStorage.userRole == UserRole.jobSeeker
            ? Get.toNamed(AppRoutes.jobSeekerDashboard)
            : Get.toNamed(AppRoutes.employerChat);
      }
    } else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        LocalStorage.userRole == UserRole.jobSeeker
            ? Get.toNamed(AppRoutes.chat)
            : Get.toNamed(AppRoutes.employerInvoiceList);
      }
    } else if (index == 3) {
      if (!(widget.currentIndex == 3)) {
        LocalStorage.userRole == UserRole.jobSeeker
            ? Get.toNamed(AppRoutes.profile)
            : Get.toNamed(AppRoutes.employerProfile);
      }
    }
  }
}
