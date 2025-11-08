import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/controller/job_seeker_home_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/salary/presentation/controller/salary_comparison_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/salary/presentation/screen/impressum_screen_details.dart';

class SalaryComparisonScreen extends StatelessWidget {
  const SalaryComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SalaryComparisonController());
    final jobSeekerHomeController = Get.put<JobSeekerHomeController>(
      JobSeekerHomeController(),
    );

    return Scaffold(
      appBar: const CommonAppBar(title: AppString.salaryComparison),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              // Company Logo
              CommonImage(imageSrc: AppImages.logo),
              24.height,

              _buildJobSection('Key Words'),
              16.height,

              _buildJobSection('Category', isDropdown: true),
              16.height,

              _buildJobSection(
                'Sub Category',
                isNumber: false,
                isDropdown: true,
              ),
              16.height,
              _buildSalarySection(jobSeekerHomeController),
              16.height,

              _buildJobSection('Enter Your Salary', isNumber: true),
              16.height,
              _buildJobSection('City', isNumber: false),
              16.height,
              _buildJobSection('State', isNumber: false),
              16.height,
              _buildJobSection('Country', isNumber: false),
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
    // Define sample dropdown items for categories
    final List<String> categoryItems = [
      'Technology',
      'Healthcare',
      'Finance',
      'Education',
      'Manufacturing',
    ];

    // Define sample dropdown items for subcategories
    final List<String> subCategoryItems = [
      'Software Development',
      'Data Analysis',
      'Cybersecurity',
      'UI/UX Design',
      'Product Management',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isDropdown)
          _DropdownField(
            hint: hint,
            items: hint == 'Category' ? categoryItems : subCategoryItems,
          )
        else
          CommonTextField(
            hintText: hint,
            keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
            fillColor: AppColors.white,
            borderColor: AppColors.background,
          ),
      ],
    );
  }

  Widget _buildSalarySection(JobSeekerHomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CommonText(
              text: 'Salary',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            12.width,
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buildSegmentButton('Hourly', 0, controller)),
                  6.width,
                  Expanded(
                    child: _buildSegmentButton('Monthly', 1, controller),
                  ),
                  6.width,
                  Expanded(child: _buildSegmentButton('Yearly', 2, controller)),
                ],
              ),
            ),
          ],
        ),
        8.height,
      ],
    );
  }

  Widget _buildSegmentButton(
    String text,
    int index,
    JobSeekerHomeController controller,
  ) {
    return Obx(() {
      final bool selected = controller.salaryTypeIndex.value == index;
      return GestureDetector(
        onTap: () => controller.updateSalaryType(index),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primaryColor
                : AppColors.blue200.withOpacity(0.5),
            gradient: selected
                ? LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF083E4B),
                      Color(0xFF074E5E),
                      Color(0xFF0288A6),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  )
                : null,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: CommonText(
            text: text,
            color: selected ? Colors.white : AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    });
  }
}

class _DropdownField extends StatefulWidget {
  final String hint;
  final List<String> items;

  const _DropdownField({required this.hint, required this.items});

  @override
  State<_DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<_DropdownField> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: widget.hint,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        8.height,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.background),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: CommonText(
                text: 'Select ${widget.hint}',
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
              value: _selectedValue,
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.textSecondary,
              ),
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: CommonText(
                    text: value,
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
