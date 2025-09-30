import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/features/employer/notifications/presentation/screen/create_jobseeker_screen.dart';
import 'package:zasulehry_job_seeker/features/employer/notifications/presentation/widgets/email_update.dart';

import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/constants/app_colors.dart';
import '../controller/employer_notifications_controller.dart';

class EmployerNotificationsScreen extends StatelessWidget {
  const EmployerNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const CommonAppBar(title: 'Notification'),
        body: Column(
          children: [
            // Tab Header
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => _buildTabItem(
                        'E-Mail',
                        0,
                        controller.selectedTab.value == 0,
                        () => controller.changeTab(0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => _buildTabItem(
                        'Push Message',
                        1,
                        controller.selectedTab.value == 1,
                        () => controller.changeTab(1),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Tab Content
            Expanded(
              child: Obx(() => _buildTabContent(controller.selectedTab.value)),
            ),

            // Create Jobseeker Alert Button
            Container(
              padding: EdgeInsets.all(16.w),
              child: CommonButton(
                titleText: 'Create Jobseeker Alert',
                onTap: () {
                  // Handle create jobseeker alert
                  Get.to(CreateJobseekerAlertScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(
    String title,
    int index,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
              width: 2.w,
            ),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.primaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(int selectedTab) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          // E-Mail Einstellungen item (only shown in E-mail tab)
          if (selectedTab == 0)
            GestureDetector(
              onTap: () {
                Get.snackbar("success", "successful prohect complete here", duration: const Duration(seconds: 1));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: AppColors.primaryColor,
                      size: 20.w,
                    ),
                    title: Text(
                      'E-Mail Einstellungen',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 16.w,
                    ),
                    onTap: () {
                      showEmailDialog(Get.context!);
                    },
                  ),
                ),
              ),
            ),

          // Push Message content
          if (selectedTab == 1)
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    size: 48.w,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Push Message Settings',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Configure your push notification preferences',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

          // Empty space if no content
          if (selectedTab == 0) SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

// Alternative implementation with TabController (more Flutter-native approach)
class NotificationScreenWithTabController extends StatefulWidget {
  const NotificationScreenWithTabController({super.key});

  @override
  State<NotificationScreenWithTabController> createState() =>
      _NotificationScreenWithTabControllerState();
}

class _NotificationScreenWithTabControllerState
    extends State<NotificationScreenWithTabController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: 'Notification'),
      body: Column(
        children: [
          // Custom Tab Header
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.black,
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'E-Mail'),
                Tab(text: 'Push Message'),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // E-Mail Tab Content
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: AppColors.primaryColor,
                            size: 24.w,
                          ),
                          title: Text(
                            'E-Mail Einstellungen',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 16.w,
                          ),
                          onTap: () {
                            Get.snackbar(
                              'Navigate',
                              'Opening E-Mail Settings',
                              backgroundColor: AppColors.primaryColor,
                              colorText: AppColors.white,
                              duration: const Duration(seconds: 1),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Push Message Tab Content
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          size: 48.w,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Push Message Settings',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Configure your push notification preferences',
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Create Jobseeker Alert Button
          Container(
            padding: EdgeInsets.all(16.w),
            child: CommonButton(
              titleText: 'Create Jobseeker Alert',
              onTap: () {
                Get.toNamed(CreateJobseekerAlertScreen().toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
