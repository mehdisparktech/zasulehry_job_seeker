import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';

import '../controller/job_seekernotification_controller.dart';

// Model for job seeker notification
class JobSeekerNotification {
  final String id;
  final String title;
  final String time;
  final bool isRead;

  JobSeekerNotification({
    required this.id,
    required this.title,
    required this.time,
    this.isRead = false,
  });
}

class JobSeekersScreen extends StatelessWidget {
  final String title;
  const JobSeekersScreen({super.key, this.title = "'Job Alerts'"});

  @override
  Widget build(BuildContext context) {
    final JobSeekersController controller = Get.put(JobSeekersController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: title,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.white, size: 35.w),
            onPressed: controller.onSettingsTap,
          ),
        ],
      ),
      body: Obx(
        () => controller.notifications.isEmpty
            ? _buildEmptyState()
            : _buildNotificationsList(controller),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none, size: 64.w, color: Colors.black),
          SizedBox(height: 16.h),
          Text(
            'No notifications yet',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(JobSeekersController controller) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: controller.notifications.length,
      itemBuilder: (context, index) {
        final notification = controller.notifications[index];
        return _buildNotificationItem(notification, controller);
      },
    );
  }

  Widget _buildNotificationItem(
    JobSeekerNotification notification,
    JobSeekersController controller,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: () => controller.onNotificationTap(notification),
        leading: Container(
          padding: EdgeInsets.all(8.w),
          child: Icon(
            Icons.notifications_none,
            color: AppColors.black,
            size: 30.w,
          ),
        ),
        title: Text(
          notification.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        trailing: Text(
          notification.time,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// Alternative version with more detailed notification items
class DetailedJobSeekersScreen extends StatelessWidget {
  const DetailedJobSeekersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final JobSeekersController controller = Get.put(JobSeekersController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'Job Seekers',
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.white, size: 24.w),
            onPressed: controller.onSettingsTap,
          ),
        ],
      ),
      body: Obx(
        () => controller.notifications.isEmpty
            ? _buildEmptyState()
            : ListView.separated(
                padding: EdgeInsets.all(16.w),
                itemCount: controller.notifications.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final notification = controller.notifications[index];
                  return _buildDetailedNotificationItem(
                    notification,
                    controller,
                  );
                },
              ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none, size: 64.w, color: Colors.grey),
          SizedBox(height: 16.h),
          Text(
            'No notifications yet',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedNotificationItem(
    JobSeekerNotification notification,
    JobSeekersController controller,
  ) {
    return GestureDetector(
      onTap: () => controller.onNotificationTap(notification),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Notification Icon
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
                size: 22.w,
              ),
            ),

            SizedBox(width: 16.w),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'New job seeker profile available',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Time
            Text(
              notification.time,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Enhanced model with more properties
class EnhancedJobSeekerNotification {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  final bool isRead;
  final NotificationType type;

  EnhancedJobSeekerNotification({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isRead = false,
    this.type = NotificationType.jobSeeker,
  });
}

enum NotificationType { jobSeeker, application, message, system }

// Enhanced controller with filtering and marking as read
class EnhancedJobSeekersController extends GetxController {
  var notifications = <EnhancedJobSeekerNotification>[].obs;
  var unreadCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() {
    notifications.value = [
      EnhancedJobSeekerNotification(
        id: '1',
        title: 'Kamran Is Ux Ui Designer',
        subtitle: 'New job seeker profile available',
        time: '12:00 Pm',
      ),
      EnhancedJobSeekerNotification(
        id: '2',
        title: 'Kamran Is Ux Ui Designer',
        subtitle: 'Profile updated',
        time: '12:00 Pm',
      ),
      EnhancedJobSeekerNotification(
        id: '3',
        title: 'Kamran Is Ux Ui Designer',
        subtitle: 'Application received',
        time: '12:00 Pm',
      ),
      EnhancedJobSeekerNotification(
        id: '4',
        title: 'Kamran Is Ux Ui Designer',
        subtitle: 'Portfolio updated',
        time: '12:00 Pm',
      ),
      EnhancedJobSeekerNotification(
        id: '5',
        title: 'Kamran Is Ux Ui Designer',
        subtitle: 'New skills added',
        time: '12:00 Pm',
      ),
      EnhancedJobSeekerNotification(
        id: '6',
        title: 'Kamran Is Ux Ui Designer',
        subtitle: 'Available for work',
        time: '12:00 Pm',
      ),
    ];

    _updateUnreadCount();
  }

  void _updateUnreadCount() {
    unreadCount.value = notifications.where((n) => !n.isRead).length;
  }

  void markAsRead(String notificationId) {
    final index = notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      notifications[index] = EnhancedJobSeekerNotification(
        id: notifications[index].id,
        title: notifications[index].title,
        subtitle: notifications[index].subtitle,
        time: notifications[index].time,
        isRead: true,
        type: notifications[index].type,
      );
      notifications.refresh();
      _updateUnreadCount();
    }
  }

  void markAllAsRead() {
    notifications.value = notifications
        .map(
          (n) => EnhancedJobSeekerNotification(
            id: n.id,
            title: n.title,
            subtitle: n.subtitle,
            time: n.time,
            isRead: true,
            type: n.type,
          ),
        )
        .toList();
    _updateUnreadCount();
  }

  void onNotificationTap(EnhancedJobSeekerNotification notification) {
    markAsRead(notification.id);
    Get.snackbar(
      'Notification',
      notification.title,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );
  }

  void onSettingsTap() {
    Get.snackbar(
      'Settings',
      'Opening notification settings',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );
  }
}
