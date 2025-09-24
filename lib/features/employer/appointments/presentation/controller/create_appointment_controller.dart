import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateAppointmentController extends GetxController {
  // Form Controllers
  final TextEditingController addressController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // Selection States
  String? selectedJobSeeker;
  String selectedDate = '';
  String selectedTime = '';
  int? selectedAppointmentOption;

  // Job Seekers List (mock data)
  final List<String> jobSeekers = [
    'Md Kamran',
    'Sarah Ahmed',
    'John Smith',
    'Emily Johnson',
    'Michael Brown',
    'Lisa Wilson',
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialize message with default text
    messageController.text =
        'Lorem Ipsum Dolor Sit Amet Consectetur. Bibendum ipsum Donec Fames Et Gravida Non Est. Vel Et In Ut Egestas Elementum Ut Tristique At Imperdiet Elit In Ut At Tristique Aliquam. Tincidunt Urna Congue Ut Rhoncibus Mattis A Eu Sodales Leo Sed Tristique At Imperdiet';
  }

  @override
  void onClose() {
    addressController.dispose();
    messageController.dispose();
    super.onClose();
  }

  // Job Seeker Selection
  void setSelectedJobSeeker(String? jobSeeker) {
    selectedJobSeeker = jobSeeker;
    update();
  }

  // Date Selection
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF056B82), // AppColors.blue500
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate = DateFormat('dd.MM.yyyy').format(picked);
      update();
    }
  }

  // Time Selection
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF056B82), // AppColors.blue500
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedTime = picked.format(context);
      update();
    }
  }

  // Appointment Option Selection
  void setSelectedAppointmentOption(int? option) {
    selectedAppointmentOption = option;
    update();
  }

  // Form Validation
  bool validateForm() {
    if (selectedJobSeeker == null || selectedJobSeeker!.isEmpty) {
      Get.snackbar(
        'Error',
        'Please select a job seeker',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (selectedDate.isEmpty) {
      Get.snackbar(
        'Error',
        'Please select a date',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (selectedTime.isEmpty) {
      Get.snackbar(
        'Error',
        'Please select a time',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (selectedAppointmentOption == null) {
      Get.snackbar(
        'Error',
        'Please select an appointment option',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (selectedAppointmentOption == 1 &&
        addressController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter meeting address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    return true;
  }

  // Confirm Appointment
  Future<void> confirmAppointment() async {
    if (!validateForm()) return;

    try {
      // Show loading
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF056B82), // AppColors.blue500
          ),
        ),
        barrierDismissible: false,
      );

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Close loading
      Get.back();

      // Show success message
      Get.snackbar(
        'Success',
        'Appointment created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate back to appointments screen
      Get.back();
    } catch (e) {
      // Close loading if still showing
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      Get.snackbar(
        'Error',
        'Failed to create appointment. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Reset Form
  void resetForm() {
    selectedJobSeeker = null;
    selectedDate = '';
    selectedTime = '';
    selectedAppointmentOption = null;
    addressController.clear();
    messageController.text =
        'Lorem Ipsum Dolor Sit Amet Consectetur. Bibendum ipsum Donec Fames Et Gravida Non Est. Vel Et In Ut Egestas Elementum Ut Tristique At Imperdiet Elit In Ut At Tristique Aliquam. Tincidunt Urna Congue Ut Rhoncibus Mattis A Eu Sodales Leo Sed Tristique At Imperdiet';
    update();
  }
}
