import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/employer/salary/presentation/controller/details_salary_controller.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/text/common_text.dart';

class DetailsSalaryScreen extends StatelessWidget {
  final DetailsSalaryController controller = Get.put(DetailsSalaryController());

  DetailsSalaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppBar(title: 'Salary Calculator'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Table Header
              _buildTableHeader(),

              SizedBox(height: 16),
              // Salary Data Table
              Expanded(
                child: Obx(
                  () => ListView(
                    children: [
                      // Salary Section
                      ...controller.salaryData.entries.map((entry) {
                        if (entry.key == 'Total Social Expenses') {
                          return Column(
                            children: [
                              SizedBox(
                                height: 2,
                                child: Container(color: Colors.grey[400]),
                              ),
                              SizedBox(height: 8),
                              _buildTableRow(
                                entry.key,
                                entry.value['Month']!,
                                entry.value['Years']!,
                              ),
                            ],
                          );
                        }
                        return _buildTableRow(
                          entry.key,
                          entry.value['Month']!,
                          entry.value['Years']!,
                        );
                      }),

                      SizedBox(height: 24),

                      // Taxes Section Header - Only show when Employee is selected
                      if (controller.value.value) ...[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: 'Taxes',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              textAlign: TextAlign.left,
                            ),

                            SizedBox(height: 16),

                            // Tax Data Table
                            ...controller.taxData.entries.map(
                              (entry) => _buildTableRow(
                                entry.key,
                                entry.value['Month']!,
                                entry.value['Years']!,
                              ),
                            ),

                            SizedBox(height: 16),

                            // Net Salary Row
                            SizedBox(
                              height: 2,
                              child: Container(color: Colors.grey[400]),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CommonText(
                                      text: 'Net',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: CommonText(
                                      text: controller.netSalary['Month']!,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: CommonText(
                                      text: controller.netSalary['Years']!,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],

                      SizedBox(height: 20),

                      /// Button
                    ],
                  ),
                ),
              ),
              IntrinsicWidth(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1.w,
                      ),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () => controller.toggleValue(true),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: controller.value.value
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20.r),
                                //border: Border.all(color: AppColors.primaryColor),
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
                                text: "Employee",
                                color: !controller.value.value
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
                            onTap: () => controller.toggleValue(false),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: !controller.value.value
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20.r),
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
                                text: "Employer",
                                color: controller.value.value
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
                ),
              ),
              SizedBox(height: 50.h),
              Row(
                children: [
                  Icon(Icons.info_outline, color: AppColors.primaryColor),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "The output is without U1/U2/U3 and BG-Verkehr.",
                        fontSize: 12.sp,
                        maxLines: 2,
                      ),
                      CommonText(
                        text: "The output is according to German Law.",
                        fontSize: 12.sp,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
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
            style: TextStyle(fontSize: 12.sp, color: AppColors.black),
          ),
          Container(
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

  Widget _buildTableHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CommonText(
              text: '',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          Expanded(
            flex: 1,
            child: CommonText(
              text: 'Month',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 1,
            child: CommonText(
              text: 'Years',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(String title, String monthValue, String yearValue) {
    bool isTotal = title.contains('Total Social');

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CommonText(
              text: title,
              fontSize: isTotal ? 12 : 12,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
              color: AppColors.black,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 1,
            child: CommonText(
              text: monthValue,
              fontSize: isTotal ? 12 : 12,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
              color: AppColors.black,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 1,
            child: CommonText(
              text: yearValue,
              fontSize: isTotal ? 12 : 12,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
              color: AppColors.black,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
