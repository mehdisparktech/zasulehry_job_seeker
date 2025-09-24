import 'package:get/get.dart';

class EmployeeNotificationSettingController extends GetxController {
  // Sample alert data
  RxList<JobAlert> alerts = <JobAlert>[
    JobAlert(name: "Kamran Is Ux Ui Designer", time: "12:00 Pm"),
    JobAlert(name: "Kamran Is Ux Ui Designer", time: "12:00 Pm"),
    JobAlert(name: "Kamran Is Ux Ui Designer", time: "12:00 Pm"),
    JobAlert(name: "Kamran Is Ux Ui Designer", time: "12:00 Pm"),
    JobAlert(name: "Kamran Is Ux Ui Designer", time: "12:00 Pm"),
    JobAlert(name: "Kamran Is Ux Ui Designer", time: "12:00 Pm"),
  ].obs;

  // Method to add new alert
  void addAlert(String name, String time) {
    alerts.add(JobAlert(name: name, time: time));
  }

  // Method to remove alert
  void removeAlert(int index) {
    alerts.removeAt(index);
  }

  // Method to clear all alerts
  void clearAllAlerts() {
    alerts.clear();
  }
}

class JobAlert {
  final String name;
  final String time;

  JobAlert({required this.name, required this.time});
}
