import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/salary/presentation/controller/salary_comparison_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/salary/presentation/screen/impressum_screen_details.dart';

class SalaryComparisonScreen extends StatelessWidget {
  const SalaryComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SalaryComparisonController());

    return Scaffold(
      appBar: const CommonAppBar(title: AppString.salaryComparison),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              // Company Logo
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF083E4B),
                      Color(0xFF074E5E),
                      Color(0xFF0288A6),
                    ],
                    stops: [0.0, 0.4, 1.0],
                  ),
                ),
                child: Center(
                  child: CommonText(
                    text: 'P',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              24.height,

              _buildJobSection('Key Words'),
              16.height,

              _buildJobSection(
                'Category',
                isDropdown: true,
              ),
              16.height,

              _buildJobSection(
                'Sub Category',
                isNumber: false,
                isDropdown: true,
              ),
              16.height,

              _buildJobSection(
                'Enter Your Salary',
                isNumber: true,
              ),
              16.height,
              _buildJobSection(
                'City',
                isNumber: false,
              ),
              16.height,
              _buildJobSection(
                'State',
                isNumber: false,
              ),
              16.height,
              _buildJobSection(
                'Country',
                isNumber: false,
              ),
              16.height,
              32.height,

              // Compare Button
              CommonButton(
                titleText: 'Start',
                onTap: () {
                  Get.to(() => ImpressumScreenDetails());
                },
                buttonHeight: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobSection(
    String hint, {
    bool isNumber = false,
    bool isDropdown = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextField(
          hintText: hint,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          fillColor: AppColors.white,
          borderColor: AppColors.background,
          suffixIcon: isDropdown
              ? Icon(Icons.keyboard_arrow_down_outlined)
              : null,
        ),
      ],
    );
  }
}
