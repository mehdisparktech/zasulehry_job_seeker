import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/employer/salary/presentation/controller/employer_salary_calculator_controller.dart';

class SalaryCalculatorScreen extends StatelessWidget {
  const SalaryCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SalaryCalculatorController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppBar(title: AppString.salaryCalculator),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Fields Section
            _buildInputField(
              'Basic Salary',
              controller.basicSalaryController,
              'Enter basic salary',
            ),
            16.height,

            _buildInputField(
              'House Rent',
              controller.houseRentController,
              'Enter house rent',
            ),
            16.height,

            _buildInputField(
              'Conveyance',
              controller.transportAllowanceController,
              'Enter conveyance',
            ),
            16.height,

            _buildInputField(
              'Medical Allowance',
              controller.medicalAllowanceController,
              'Enter medical allowance',
            ),
            16.height,

            _buildInputField(
              'Other Allowance',
              controller.otherAllowanceController,
              'Enter other allowance',
            ),
            16.height,

            _buildInputField(
              'Festival Bonus',
              controller.bonusController,
              'Enter festival bonus',
            ),
            24.height,

            // Toggle Switches Section
            CommonText(
              text: 'Tax Calculation',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            16.height,

            _buildToggleRow('Tax Free Allowance', true),
            12.height,
            _buildToggleRow('Yearly Bonus', false),
            12.height,
            _buildToggleRow('Provident Fund', false),
            32.height,

            // Calculate Button
            CommonButton(
              titleText: 'Calculate',
              onTap: () {
                controller.calculateSalary();
                _showResultBottomSheet(context, controller);
              },
              buttonHeight: 50.h,
            ),

            20.height,
          ],
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    String hint,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        8.height,
        CommonTextField(
          controller: controller,
          hintText: hint,
          keyboardType: TextInputType.number,
          fillColor: AppColors.filledColor,
          borderColor: AppColors.background,
        ),
      ],
    );
  }

  Widget _buildToggleRow(String title, bool initialValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        Switch(
          value: initialValue,
          onChanged: (value) {
            // Handle toggle
          },
          activeColor: AppColors.primaryColor,
        ),
      ],
    );
  }

  void _showResultBottomSheet(
    BuildContext context,
    SalaryCalculatorController controller,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                20.height,

                CommonText(
                  text: 'Salary Details',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                24.height,

                // Results
                _buildResultRow('Basic Salary', controller.basicSalary.value),
                _buildResultRow('House Rent', controller.houseRent.value),
                _buildResultRow(
                  'Conveyance',
                  controller.transportAllowance.value,
                ),
                _buildResultRow(
                  'Medical Allowance',
                  controller.medicalAllowance.value,
                ),
                _buildResultRow(
                  'Other Allowance',
                  controller.otherAllowance.value,
                ),
                _buildResultRow('Festival Bonus', controller.bonus.value),

                Divider(height: 32.h, color: AppColors.background),

                _buildResultRow(
                  'Gross Salary',
                  controller.grossSalary.value,
                  isTotal: true,
                ),
                _buildResultRow(
                  'Tax',
                  controller.incomeTax.value / 12,
                  isNegative: true,
                ),

                Divider(height: 32.h, color: AppColors.background),

                _buildResultRow(
                  'Net Salary',
                  controller.netSalary.value,
                  isHighlighted: true,
                ),

                const Spacer(),

                Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        titleText: 'Share',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        buttonColor: AppColors.white,
                        titleColor: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                      ),
                    ),
                    16.width,
                    Expanded(
                      child: CommonButton(
                        titleText: 'Download',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultRow(
    String title,
    double amount, {
    bool isTotal = false,
    bool isNegative = false,
    bool isHighlighted = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            fontSize: isHighlighted ? 16 : 14,
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w500,
            color: isHighlighted ? AppColors.primaryColor : AppColors.black,
          ),
          CommonText(
            text: '${isNegative ? '-' : ''}৳ ${amount.toStringAsFixed(0)}',
            fontSize: isHighlighted ? 16 : 14,
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w500,
            color: isHighlighted
                ? AppColors.primaryColor
                : (isNegative ? AppColors.red : AppColors.black),
          ),
        ],
      ),
    );
  }
}
