import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/features/employer/notifications/presentation/controller/employee_notification_setting_controller.dart';
import 'package:zasulehry_job_seeker/features/employer/notifications/presentation/screen/create_jobseeker_screen.dart';
import '../../../../../core/component/text/common_text.dart';

class EmployeeNotificationSettingScreen extends StatelessWidget {
  final EmployeeNotificationSettingController controller = Get.put(
    EmployeeNotificationSettingController(),
  );

  EmployeeNotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE6E6E6),
      appBar: CommonAppBar(
        title: "Job Alerts",
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CreateJobseekerAlertScreen());
            },
            icon: Icon(Icons.settings, size: 30),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.alerts.length,
          itemBuilder: (context, index) {
            final alert = controller.alerts[index];
            return _buildAlertItem(alert, index);
          },
        ),
      ),
    );
  }

  Widget _buildAlertItem(JobAlert alert, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Bell Icon
          CommonImage(imageSrc: AppImages.notification2),

          SizedBox(width: 12),

          // Alert Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: alert.name,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  maxLines: 2,
                ),
              ],
            ),
          ),

          // Time
          CommonText(
            text: alert.time,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
