import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployerSalaryCalculatorController extends GetxController {
  // Tab selection
  var selectedTime = 'Monthly'.obs;
  var selectedNet = 'Gross'.obs;
  final tab1 = ['Monthly', 'Yearly',];
  final tab2 = ['Gross', 'Net',];

  // Form controllers
  final grossSalaryController = TextEditingController(text: '20000.00');
  final yearController = TextEditingController();
  final taxExemptionController = TextEditingController();
  final professionController = TextEditingController();

  // Dropdown values
  var selectedYear = '2025'.obs;
  var selectedState = 'Berlin'.obs;
  var selectedChildTaxExemption = 'Please Select'.obs;
  var selectedAge = '17-72 years'.obs;
  var selectedGender = 'Male'.obs;

  // Tax class selection
  var selectedTaxClass = 1.obs;

  // Toggle switches
  var doYouPayChurchTax = false.obs;
  var gender = false.obs;
  var healthInsurance = false.obs;
  var careInsurance = false.obs;
  var pensionInsurance = false.obs;
  var unemploymentInsurance = false.obs;
  var doYouHaveChildren = false.obs;

  // Calculated result
  var calculatedSalary = 0.0.obs;

  @override
  void onClose() {
    grossSalaryController.dispose();
    yearController.dispose();
    taxExemptionController.dispose();
    professionController.dispose();
    super.onClose();
  }

  void selectTime(String tab) {
    selectedTime.value = tab;
  }
  void selectNet(String tab) {
    selectedTime.value = tab;
  }

  void selectTaxClass(int taxClass) {
    selectedTaxClass.value = taxClass;
  }

  void toggleChurchTax(bool value) {
    doYouPayChurchTax.value = value;
  }

  void toggleMaleFemaile(bool value) {
    gender.value = value;
  }

  void toggleHealthInsurance(bool value) {
    healthInsurance.value = value;
  }

  void toggleCareInsurance(bool value) {
    careInsurance.value = value;
  }

  void togglePensionInsurance(bool value) {
    pensionInsurance.value = value;
  }

  void toggleUnemploymentInsurance(bool value) {
    unemploymentInsurance.value = value;
  }

  void toggleHaveChildren(bool value) {
    doYouHaveChildren.value = value;
  }

  void calculate() {
    // Simple calculation logic - replace with actual tax calculation
    double grossSalary = double.tryParse(grossSalaryController.text) ?? 0.0;
    calculatedSalary.value = grossSalary * 0.7; // Example: 30% tax deduction
  }

  void moreInformation() {
    Get.snackbar(
      'Information',
      'More information about salary calculation',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }
}