import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaryComparisonController extends GetxController {
  // Job 1 controllers
  final job1TitleController = TextEditingController();
  final job1CompanyController = TextEditingController();
  final job1SalaryController = TextEditingController();
  final job1BonusController = TextEditingController();
  final job1LocationController = TextEditingController();
  
  // Job 2 controllers
  final job2TitleController = TextEditingController();
  final job2CompanyController = TextEditingController();
  final job2SalaryController = TextEditingController();
  final job2BonusController = TextEditingController();
  final job2LocationController = TextEditingController();
  
  // Observable values for Job 1
  final RxDouble job1Salary = 0.0.obs;
  final RxDouble job1Bonus = 0.0.obs;
  final RxDouble job1TotalAnnual = 0.0.obs;
  
  // Observable values for Job 2
  final RxDouble job2Salary = 0.0.obs;
  final RxDouble job2Bonus = 0.0.obs;
  final RxDouble job2TotalAnnual = 0.0.obs;
  
  // Comparison results
  final RxDouble salaryDifference = 0.0.obs;
  final RxString betterOption = ''.obs;
  final RxDouble percentageDifference = 0.0.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Listen to text field changes
    job1SalaryController.addListener(() => updateJob1Salary());
    job1BonusController.addListener(() => updateJob1Bonus());
    job2SalaryController.addListener(() => updateJob2Salary());
    job2BonusController.addListener(() => updateJob2Bonus());
  }
  
  void updateJob1Salary() {
    job1Salary.value = double.tryParse(job1SalaryController.text) ?? 0.0;
    calculateComparison();
  }
  
  void updateJob1Bonus() {
    job1Bonus.value = double.tryParse(job1BonusController.text) ?? 0.0;
    calculateComparison();
  }
  
  void updateJob2Salary() {
    job2Salary.value = double.tryParse(job2SalaryController.text) ?? 0.0;
    calculateComparison();
  }
  
  void updateJob2Bonus() {
    job2Bonus.value = double.tryParse(job2BonusController.text) ?? 0.0;
    calculateComparison();
  }
  
  void calculateComparison() {
    // Calculate total annual compensation
    job1TotalAnnual.value = (job1Salary.value * 12) + job1Bonus.value;
    job2TotalAnnual.value = (job2Salary.value * 12) + job2Bonus.value;
    
    // Calculate difference
    salaryDifference.value = (job1TotalAnnual.value - job2TotalAnnual.value).abs();
    
    // Determine better option
    if (job1TotalAnnual.value > job2TotalAnnual.value) {
      betterOption.value = 'Job 1';
      percentageDifference.value = job2TotalAnnual.value > 0 
          ? ((job1TotalAnnual.value - job2TotalAnnual.value) / job2TotalAnnual.value) * 100
          : 0.0;
    } else if (job2TotalAnnual.value > job1TotalAnnual.value) {
      betterOption.value = 'Job 2';
      percentageDifference.value = job1TotalAnnual.value > 0 
          ? ((job2TotalAnnual.value - job1TotalAnnual.value) / job1TotalAnnual.value) * 100
          : 0.0;
    } else {
      betterOption.value = 'Equal';
      percentageDifference.value = 0.0;
    }
  }
  
  void clearAll() {
    // Clear Job 1
    job1TitleController.clear();
    job1CompanyController.clear();
    job1SalaryController.clear();
    job1BonusController.clear();
    job1LocationController.clear();
    
    // Clear Job 2
    job2TitleController.clear();
    job2CompanyController.clear();
    job2SalaryController.clear();
    job2BonusController.clear();
    job2LocationController.clear();
    
    // Reset values
    job1Salary.value = 0.0;
    job1Bonus.value = 0.0;
    job2Salary.value = 0.0;
    job2Bonus.value = 0.0;
    
    calculateComparison();
  }
  
  @override
  void onClose() {
    // Dispose Job 1 controllers
    job1TitleController.dispose();
    job1CompanyController.dispose();
    job1SalaryController.dispose();
    job1BonusController.dispose();
    job1LocationController.dispose();
    
    // Dispose Job 2 controllers
    job2TitleController.dispose();
    job2CompanyController.dispose();
    job2SalaryController.dispose();
    job2BonusController.dispose();
    job2LocationController.dispose();
    
    super.onClose();
  }
}