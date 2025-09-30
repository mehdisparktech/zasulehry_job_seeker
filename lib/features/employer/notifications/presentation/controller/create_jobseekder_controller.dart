import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';

// Controller for managing Create Jobseeker Alert screen state
class CreateJobseekerAlertController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final jobTitleController = TextEditingController();
  final cityPostCodeController = TextEditingController();

  // Push Message toggle
  var isPushMessageEnabled = true.obs;

  // Email Address toggle
  var isEmailEnabled = true.obs;

  // Push Message frequency selection
  var selectedFrequency = 'Every Day'.obs;
  final frequencies = ['Every Day', 'Weekly'];

  // Privacy policy acceptance
  var isPrivacyPolicyAccepted = false.obs;

  @override
  void onClose() {
    jobTitleController.dispose();
    cityPostCodeController.dispose();
    super.onClose();
  }

  void togglePushMessage(bool value) {
    isPushMessageEnabled.value = value;
  }

  void toggleEmail(bool value) {
    isEmailEnabled.value = value;
  }

  void selectFrequency(String frequency) {
    selectedFrequency.value = frequency;
  }

  void togglePrivacyPolicy(bool value) {
    isPrivacyPolicyAccepted.value = value;
  }

  void showFilterOptions() {
    // Handle filter button tap
    Get.snackbar(
      'Filter',
      'Opening filter options',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );
  }

  void submitAlert() {
    if (formKey.currentState?.validate() == true) {
      if (!isPrivacyPolicyAccepted.value) {
        Get.snackbar(
          'Error',
          'Please accept the Privacy Policy and Terms & Conditions',
          backgroundColor: Colors.red,
          colorText: AppColors.white,
          duration: const Duration(seconds: 1),
        );
        return;
      }

      // Handle form submission
      Get.snackbar(
        'Success',
        'Jobseeker alert created successfully',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.white,
        duration: const Duration(seconds: 1),
      );
      Get.back();
    }
  }
}
