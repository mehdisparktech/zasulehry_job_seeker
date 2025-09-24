import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/utils/helpers/other_helper.dart';

class AppointmentsController extends GetxController {
  // Observable variables
  final RxInt selectedTabIndex = 0.obs;
  final RxList<String> tabs = ['Confirmed', 'Pending', 'Cancelled'].obs;
  final TextEditingController messageController = TextEditingController();

  // Dropdown options for appointment request
  final RxList<String> appointmentTypes = [
    'Interview',
    'Meeting',
    'Consultation',
    'Follow-up',
    'Other',
  ].obs;
  final RxString selectedAppointmentType = 'Interview'.obs;

  // Sample data - In real app, this would come from API
  final List<Map<String, dynamic>> confirmedAppointments = [
    {
      'name': 'Md Kamran',
      'date': '10.02.2025',
      'time': '17:26',
      'status': 'Confirmed',
      'statusColor': AppColors.blue500,
      'showActions': true,
      'isConfirmed': true,
    },
  ];

  final List<Map<String, dynamic>> pendingAppointments = [
    {
      'name': 'Md Kamran',
      'date': '10.02.2025',
      'time': '17:26',
      'status': 'Pending',
      'statusColor': AppColors.red,
      'showActions': true,
      'isConfirmed': false,
    },
    {
      'name': 'Md Kamran',
      'date': '10.02.2025',
      'time': '17:26',
      'status': 'Cancelled by You',
      'statusColor': AppColors.red,
      'showActions': false,
      'isConfirmed': false,
    },
    {
      'name': 'Md Kamran',
      'date': '10.02.2025',
      'time': '17:26',
      'status': 'Cancelled by Kamran',
      'statusColor': AppColors.red,
      'showActions': false,
      'isConfirmed': false,
    },
  ];

  final List<Map<String, dynamic>> cancelledAppointments = [
    {
      'name': 'Md Kamran',
      'date': '10.02.2025',
      'time': '17:26',
      'status': 'Cancelled by You',
      'statusColor': AppColors.red,
      'showActions': false,
      'isConfirmed': false,
      'isCancelled': true,
    },
    {
      'name': 'Md Kamran',
      'date': '10.02.2025',
      'time': '17:26',
      'status': 'Cancelled by Kamran',
      'statusColor': AppColors.red,
      'showActions': false,
      'isConfirmed': false,
      'isCancelled': true,
    },
  ];

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  // Tab selection methods
  void selectTab(int index) {
    selectedTabIndex.value = index;
  }

  // Get appointments based on selected tab
  List<Map<String, dynamic>> getCurrentAppointments() {
    switch (selectedTabIndex.value) {
      case 0:
        return confirmedAppointments;
      case 1:
        return pendingAppointments;
      case 2:
        return cancelledAppointments;
      default:
        return [];
    }
  }

  // Action methods
  void confirmAppointment() {
    // Handle confirm appointment logic
    Get.back();
  }

  void cancelAppointment() {
    // Handle cancel appointment logic
    print('Appointment cancelled');
  }

  void sendAppointmentRequest() {
    if (messageController.text.trim().isNotEmpty) {
      // Handle send appointment request logic
      print('Appointment request sent: ${messageController.text}');
      print('Appointment type: ${selectedAppointmentType.value}');
      messageController.clear();
      Get.back();
    }
  }

  // Method to update selected appointment type
  void updateSelectedAppointmentType(String? newValue) {
    if (newValue != null) {
      selectedAppointmentType.value = newValue;
    }
  }

  void replyToAppointment() {
    // Handle reply to appointment logic
    Get.back();
  }

  // Validation
  String? validateMessage(String? value) {
    return OtherHelper.validator(value);
  }
}
