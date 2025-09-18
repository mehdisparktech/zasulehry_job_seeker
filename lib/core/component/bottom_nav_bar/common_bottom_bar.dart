import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/log/app_log.dart';

class CommonBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CommonBottomNavBar({required this.currentIndex, super.key});

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  var bottomNavIndex = 0;
  List<Widget> unselectedIcons = [
    const Icon(Icons.home_outlined, color: AppColors.black),
    const Icon(Icons.dashboard_outlined, color: AppColors.black),
    const Icon(Icons.chat, color: AppColors.black),
    const Icon(Icons.person_2_outlined, color: AppColors.black),
  ];

  List<Widget> selectedIcons = [
    const Icon(Icons.home_outlined, color: AppColors.primaryColor),
    const Icon(Icons.dashboard_outlined, color: AppColors.primaryColor),
    const Icon(Icons.chat, color: AppColors.primaryColor),
    const Icon(Icons.person, color: AppColors.primaryColor),
  ];

  List<String> text = ["Home", "Dashboard", "Chat", "Profile"];
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
        Get.toNamed(AppRoutes.jobSeekerHome);
      }
    } else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        Get.toNamed(AppRoutes.jobSeekerDashboard);
      }
    } else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        Get.toNamed(AppRoutes.chat);
      }
    } else if (index == 3) {
      if (!(widget.currentIndex == 3)) {
        Get.toNamed(AppRoutes.profile);
      }
    }
  }
}
