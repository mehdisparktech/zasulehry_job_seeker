import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../screen/job_seeker_notification.dart';

class JobSeekersController extends GetxController {
  var notifications = <JobSeekerNotification>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() {
    // Sample data - replace with actual API call
    notifications.value = [
      JobSeekerNotification(
        id: '1',
        title: 'Kamran Is Ux Ui Designer',
        time: '12:00 Pm',
      ),
      JobSeekerNotification(
        id: '2',
        title: 'Kamran Is Ux Ui Designer',
        time: '12:00 Pm',
      ),
      JobSeekerNotification(
        id: '3',
        title: 'Kamran Is Ux Ui Designer',
        time: '12:00 Pm',
      ),
      JobSeekerNotification(
        id: '4',
        title: 'Kamran Is Ux Ui Designer',
        time: '12:00 Pm',
      ),
      JobSeekerNotification(
        id: '5',
        title: 'Kamran Is Ux Ui Designer',
        time: '12:00 Pm',
      ),
      JobSeekerNotification(
        id: '6',
        title: 'Kamran Is Ux Ui Designer',
        time: '12:00 Pm',
      ),
    ];
  }

  void onNotificationTap(JobSeekerNotification notification) {
    // Handle notification tap
    Get.snackbar(
      'Notification Tapped',
      notification.title,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
      duration: const Duration(seconds: 1),
    );
  }

  void onSettingsTap() {
    // Handle settings button tap
    Get.snackbar(
      'Settings',
      'Opening settings',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
      duration: const Duration(seconds: 1),
    );
  }
}
