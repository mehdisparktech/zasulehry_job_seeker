import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/employer/salary/presentation/controller/employer_salary_calculator_controller.dart';
import 'package:zasulehry_job_seeker/features/employer/salary/presentation/screen/details_salary_screen.dart';

class SalaryCalculatorScreen extends StatelessWidget {
  const SalaryCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployerSalaryCalculatorController controller = Get.put(
      EmployerSalaryCalculatorController(),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppBar(title: 'Salary Calculator'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Selection
            _buildTabSelection(controller),

            SizedBox(height: 20.h),

            // Gross Salary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle('Gross Salary'),
                SizedBox(
                  width: 200,
                  child: CommonTextField(
                    controller: controller.grossSalaryController,
                    hintText: '20000.00',
                    borderColor: Colors.grey,
                    fillColor: Colors.transparent,
                    keyboardType: TextInputType.number,
                    suffixIcon: Icon(Icons.euro, size: 20.w),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Year
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle('Year'),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 200,
                  child: _buildDropdownField('2025', ['2024', '2025', '2026']),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Tax Exemption
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle('Tax Exemption'),
                SizedBox(
                  width: 200,
                  child: CommonTextField(
                    controller: controller.taxExemptionController,
                    hintText: 'Type',
                    suffixIcon: Icon(Icons.euro, size: 20.w),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Your State
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle('Your State'),
                SizedBox(
                  width: 200,
                  child: _buildDropdownField('Berlin', [
                    'Berlin',
                    'Munich',
                    'Hamburg',
                  ]),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle('Tax Class'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: _buildTaxClassSelection(controller),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Insurance Toggles
            _buildToggleItem(
              'Do You Pay Church Tax',
              controller.doYouPayChurchTax,
              controller.toggleChurchTax,
              "Yes",
              "No",
            ),
            _buildToggleItem(
              'Health Insurance',
              controller.healthInsurance,
              controller.toggleHealthInsurance,
              "Yes",
              "No",
            ),
            _buildToggleItem(
              'Care Insurance',
              controller.careInsurance,
              controller.toggleCareInsurance,
              "Yes",
              "No",
            ),
            _buildToggleItem(
              'Pension Insurance',
              controller.pensionInsurance,
              controller.togglePensionInsurance,
              "Yes",
              "No",
            ),
            _buildToggleItem(
              'Unemployment Insurance',
              controller.unemploymentInsurance,
              controller.toggleUnemploymentInsurance,
              "Yes",
              "No",
            ),
            _buildToggleItem(
              'Do You Have Children',
              controller.doYouHaveChildren,
              controller.toggleHaveChildren,
              "Yes",
              "No",
            ),

            SizedBox(height: 20.h),

            // Child Tax Exemption
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle('Child Tax Exemption'),
                _buildDropdownField('Please Select', [
                  'Please Select',
                  '1 Child',
                  '2 Children',
                ]),
              ],
            ),

            //SizedBox(height: 8.h),
            SizedBox(height: 20.h),

            // Your Age
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle('Your Age'),
                _buildDropdownField('17-72 years', [
                  '17-72 years',
                  '18-65 years',
                ]),
              ],
            ),

            SizedBox(height: 20.h),

            // Your Profession
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle('Your Profession'),
                SizedBox(
                  width: 200,
                  child: CommonTextField(
                    controller: controller.professionController,
                    hintText: 'Type Here...',
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Gender
            _buildToggleItem(
              'Gender',
              controller.gender,
              controller.toggleMaleFemaile,
              "Male",
              "Female",
            ),

            SizedBox(height: 20.h),

            // Calculate Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CommonButton(
                    titleText: 'Calculate',
                    onTap: () {
                      controller.calculate();
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CommonButton(
                    titleText: "\$456784",
                    buttonColor: Colors.transparent,
                    titleColor: Colors.black,
                    borderColor: AppColors.blue500,
                    titleSize: 20,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // More Information Button
            CommonButton(
              titleText: 'More Information',
              buttonColor: AppColors.primaryColor,
              onTap: () {
                Get.to(() => DetailsSalaryScreen());
              },
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSelection(EmployerSalaryCalculatorController controller) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: Colors.transparent,
                border: Border.all(color: AppColors.primaryColor, width: 3.w),
              ),
              child: Row(
                children: controller.tab1.map((tab) {
                  return Expanded(
                    child: Obx(
                      () => GestureDetector(
                        onTap: () => controller.selectedTime(tab),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: controller.selectedTime.value == tab
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30.r),
                            gradient: controller.selectedTime.value == tab
                                ? LinearGradient(
                                    begin: Alignment(-0.9, 0),
                                    end: Alignment(1.0, 0),
                                    colors: [
                                      Color(0xFF083E4B), // #083E4B
                                      Color(0xFF074E5E), // #074E5E
                                      Color(0xFF0288A6), // #0288A6
                                    ],
                                    stops: [0.0, 0.4, 1.0],
                                  )
                                : null,
                          ),
                          child: Text(
                            tab,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: controller.selectedTime.value == tab
                                  ? AppColors.white
                                  : AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: Colors.transparent,
                border: Border.all(color: AppColors.primaryColor, width: 3.w),
              ),
              child: Row(
                children: controller.tab2.map((tab) {
                  return Expanded(
                    child: Obx(
                      () => GestureDetector(
                        onTap: () => controller.selectedNet(tab),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: controller.selectedNet.value == tab
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(25.r),
                            gradient: controller.selectedNet.value == tab
                                ? LinearGradient(
                                    begin: Alignment(-0.9, 0),
                                    end: Alignment(1.0, 0),
                                    colors: [
                                      Color(0xFF083E4B), // #083E4B
                                      Color(0xFF074E5E), // #074E5E
                                      Color(0xFF0288A6), // #0288A6
                                    ],
                                    stops: [0.0, 0.4, 1.0],
                                  )
                                : null,
                          ),
                          child: Text(
                            tab,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: controller.selectedNet.value == tab
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    );
  }

  Widget _buildTaxClassSelection(
    EmployerSalaryCalculatorController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
      ),
      child: Row(
        children: List.generate(6, (index) {
          int taxClass = index + 1;
          return Expanded(
            child: Obx(
              () => GestureDetector(
                onTap: () => controller.selectTaxClass(taxClass),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: controller.selectedTaxClass.value == taxClass
                        ? AppColors.blue500
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: index == 0 ? Radius.circular(23.r) : Radius.zero,
                      bottomLeft: index == 0
                          ? Radius.circular(23.r)
                          : Radius.zero,
                      topRight: index == 5
                          ? Radius.circular(23.r)
                          : Radius.zero,
                      bottomRight: index == 5
                          ? Radius.circular(23.r)
                          : Radius.zero,
                    ),
                  ),
                  child: Text(
                    taxClass.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: controller.selectedTaxClass.value == taxClass
                          ? AppColors.white
                          : AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDropdownField(String value, List<String> items) {
    return Container(
      width: 200,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 16.sp, color: AppColors.black),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20.w),
        ],
      ),
    );
  }

  Widget _buildToggleItem(
    String title,
    RxBool value,
    Function(bool) onToggle,
    String button,
    String buttons,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, color: AppColors.black),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: Colors.transparent,
              border: Border.all(color: AppColors.primaryColor, width: 1.w),
            ),
            child: Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () => onToggle(true),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: value.value
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.primaryColor),
                        gradient: LinearGradient(
                          begin: Alignment(-0.9, 0),
                          end: Alignment(1.0, 0),
                          colors: [
                            Color(0xFF083E4B), // #083E4B
                            Color(0xFF074E5E), // #074E5E
                            Color(0xFF0288A6), // #0288A6
                          ],
                          stops: [0.0, 0.4, 1.0],
                        ),
                      ),
                      child: CommonText(
                        text: button,
                        color: !value.value
                            ? AppColors.primaryColor
                            : AppColors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Obx(
                  () => GestureDetector(
                    onTap: () => onToggle(false),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: !value.value
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColors.primaryColor),
                        gradient: LinearGradient(
                          begin: Alignment(-0.9, 0),
                          end: Alignment(1.0, 0),
                          colors: [
                            Color(0xFF083E4B), // #083E4B
                            Color(0xFF074E5E), // #074E5E
                            Color(0xFF0288A6), // #0288A6
                          ],
                          stops: [0.0, 0.4, 1.0],
                        ),
                      ),
                      child: CommonText(
                        text: buttons,
                        color: value.value
                            ? AppColors.primaryColor
                            : AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _buildGenderSelection(
    EmployerSalaryCalculatorController controller,
    RxBool value,
    Function(bool) onToggle,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Colors.transparent,
        border: Border.all(color: AppColors.primaryColor, width: 1.w),
      ),
      child: Row(
        children: [
          Obx(
            () => GestureDetector(
              onTap: () => onToggle(true),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: value.value
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.primaryColor),
                  gradient: LinearGradient(
                    begin: Alignment(-0.9, 0),
                    end: Alignment(1.0, 0),
                    colors: [
                      Color(0xFF083E4B), // #083E4B
                      Color(0xFF074E5E), // #074E5E
                      Color(0xFF0288A6), // #0288A6
                    ],
                    stops: [0.0, 0.4, 1.0],
                  ),
                ),
                child: CommonText(
                  text: "Male",
                  color: !value.value
                      ? AppColors.primaryColor
                      : AppColors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Obx(
            () => GestureDetector(
              onTap: () => onToggle(false),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: !value.value
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.primaryColor),
                  gradient: LinearGradient(
                    begin: Alignment(-0.9, 0),
                    end: Alignment(1.0, 0),
                    colors: [
                      Color(0xFF083E4B), // #083E4B
                      Color(0xFF074E5E), // #074E5E
                      Color(0xFF0288A6), // #0288A6
                    ],
                    stops: [0.0, 0.4, 1.0],
                  ),
                ),
                child: CommonText(
                  text: "Female",
                  color: value.value ? AppColors.primaryColor : AppColors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
