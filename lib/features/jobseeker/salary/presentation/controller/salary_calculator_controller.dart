import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaryCalculatorController extends GetxController {
  // Text controllers
  final basicSalaryController = TextEditingController();
  final houseRentController = TextEditingController();
  final medicalAllowanceController = TextEditingController();
  final transportAllowanceController = TextEditingController();
  final otherAllowanceController = TextEditingController();
  final bonusController = TextEditingController();
  
  // Observable values
  final RxDouble basicSalary = 0.0.obs;
  final RxDouble houseRent = 0.0.obs;
  final RxDouble medicalAllowance = 0.0.obs;
  final RxDouble transportAllowance = 0.0.obs;
  final RxDouble otherAllowance = 0.0.obs;
  final RxDouble bonus = 0.0.obs;
  
  // Tax calculation
  final RxDouble taxableIncome = 0.0.obs;
  final RxDouble incomeTax = 0.0.obs;
  final RxDouble netSalary = 0.0.obs;
  final RxDouble grossSalary = 0.0.obs;
  
  // Tax-free threshold (Bangladesh standard)
  final double taxFreeThreshold = 350000.0;
  
  @override
  void onInit() {
    super.onInit();
    // Listen to text field changes
    basicSalaryController.addListener(() => updateBasicSalary());
    houseRentController.addListener(() => updateHouseRent());
    medicalAllowanceController.addListener(() => updateMedicalAllowance());
    transportAllowanceController.addListener(() => updateTransportAllowance());
    otherAllowanceController.addListener(() => updateOtherAllowance());
    bonusController.addListener(() => updateBonus());
  }
  
  void updateBasicSalary() {
    basicSalary.value = double.tryParse(basicSalaryController.text) ?? 0.0;
    calculateSalary();
  }
  
  void updateHouseRent() {
    houseRent.value = double.tryParse(houseRentController.text) ?? 0.0;
    calculateSalary();
  }
  
  void updateMedicalAllowance() {
    medicalAllowance.value = double.tryParse(medicalAllowanceController.text) ?? 0.0;
    calculateSalary();
  }
  
  void updateTransportAllowance() {
    transportAllowance.value = double.tryParse(transportAllowanceController.text) ?? 0.0;
    calculateSalary();
  }
  
  void updateOtherAllowance() {
    otherAllowance.value = double.tryParse(otherAllowanceController.text) ?? 0.0;
    calculateSalary();
  }
  
  void updateBonus() {
    bonus.value = double.tryParse(bonusController.text) ?? 0.0;
    calculateSalary();
  }
  
  void calculateSalary() {
    // Calculate gross salary (monthly)
    grossSalary.value = basicSalary.value + 
                       houseRent.value + 
                       medicalAllowance.value + 
                       transportAllowance.value + 
                       otherAllowance.value;
    
    // Calculate annual taxable income
    double annualGross = grossSalary.value * 12 + bonus.value;
    
    // Tax calculation based on Bangladesh tax structure
    if (annualGross <= taxFreeThreshold) {
      incomeTax.value = 0.0;
    } else {
      double taxableAmount = annualGross - taxFreeThreshold;
      
      // Simplified tax calculation (5% for first 100k, 10% for next 300k, etc.)
      if (taxableAmount <= 100000) {
        incomeTax.value = taxableAmount * 0.05;
      } else if (taxableAmount <= 400000) {
        incomeTax.value = 100000 * 0.05 + (taxableAmount - 100000) * 0.10;
      } else if (taxableAmount <= 500000) {
        incomeTax.value = 100000 * 0.05 + 300000 * 0.10 + (taxableAmount - 400000) * 0.15;
      } else {
        incomeTax.value = 100000 * 0.05 + 300000 * 0.10 + 100000 * 0.15 + (taxableAmount - 500000) * 0.20;
      }
    }
    
    // Calculate net monthly salary
    double monthlyTax = incomeTax.value / 12;
    netSalary.value = grossSalary.value - monthlyTax;
    taxableIncome.value = annualGross;
  }
  
  void clearAll() {
    basicSalaryController.clear();
    houseRentController.clear();
    medicalAllowanceController.clear();
    transportAllowanceController.clear();
    otherAllowanceController.clear();
    bonusController.clear();
    
    basicSalary.value = 0.0;
    houseRent.value = 0.0;
    medicalAllowance.value = 0.0;
    transportAllowance.value = 0.0;
    otherAllowance.value = 0.0;
    bonus.value = 0.0;
    
    calculateSalary();
  }
  
  @override
  void onClose() {
    basicSalaryController.dispose();
    houseRentController.dispose();
    medicalAllowanceController.dispose();
    transportAllowanceController.dispose();
    otherAllowanceController.dispose();
    bonusController.dispose();
    super.onClose();
  }
}