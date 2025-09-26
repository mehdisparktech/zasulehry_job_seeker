import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/cvcreation_pages/presentaion/controller/cv_create_controller.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/button/common_button.dart';

class CvCreateStep2Screen extends StatelessWidget {
  CvCreateStep2Screen({super.key});

  final CvCreateController controller = Get.find<CvCreateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: "CV/Resume Creation - Step 2"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Indicator
            _buildProgressIndicator(),
            SizedBox(height: 24.h),

            // Step 2 Content
            _buildStep2Content(),

            SizedBox(height: 32.h),

            // Navigation Buttons
            _buildNavigationButtons(),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      children: [
        _buildProgressStep(0, true), // First step (completed)
        _buildProgressLine(true), // Completed line
        _buildProgressStep(1, true), // Current step (active)
        _buildProgressLine(false), // Not completed yet
        _buildProgressStep(2, false), // Final step (inactive)
      ],
    );
  }

  Widget _buildProgressStep(int stepIndex, bool isActive) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.primaryColor : Colors.grey[300],
      ),
      child: Center(
        child: Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.white : Colors.grey[500],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2.h,
        color: isActive ? AppColors.primaryColor : Colors.grey[300],
      ),
    );
  }

  Widget _buildStep2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Work Experience Section
        _buildWorkExperienceSection(),
        SizedBox(height: 24.h),

        // Skills & Activities Section
        _buildSkillsSection(),
        SizedBox(height: 24.h),

        // Portfolio Section
        _buildPortfolioSection(),
      ],
    );
  }

  Widget _buildWorkExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "Work Experience",
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
        SizedBox(height: 16.h),

        Obx(
          () => _buildDropdownField(
            controller.selectedPersonalInfoType.value,
            controller.personalInfoOptions,
            Icons.keyboard_arrow_down,
            onChanged: (value) => controller.updatePersonalInfoType(value),
          ),
        ),

        SizedBox(height: 16.h),
        _buildTextField(
          'Job Title :',
          controller.jobTitleController,
          'Enter Job Title',
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          'Company/Institute Name :',
          controller.companyController,
          'Enter Company Name',
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          'Location :',
          controller.locationController,
          'Enter Location',
        ),
        SizedBox(height: 12.h),

        Row(
          children: [
            CommonText(
              text: "Current Working : ",
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 12.w),
            CommonButton(
              titleText: "Yes",
              buttonWidth: 60.w,
              titleSize: 12,
              buttonHeight: 38.h,
              onTap: () {},
            ),
            SizedBox(width: 8.w),
            CommonButton(
              titleText: "No",
              buttonWidth: 60.w,
              titleSize: 12,
              buttonHeight: 38.h,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 12.h),

        _buildTextField(
          'Date From :',
          controller.workFromController,
          'Enter Date From',
          isDate: true,
        ),
        SizedBox(height: 14.h),
        _buildTextField(
          'Date To :',
          controller.workToController,
          'Enter Date To',
          isDate: true,
        ),
        SizedBox(height: 14.h),

        CommonText(text: "Work Details"),
        SizedBox(height: 8.h),
        CommonTextField(hintText: "Enter Work Details", maxLines: 3),
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "Skills & Activities",
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
        SizedBox(height: 16.h),

        Obx(
          () => _buildDropdownField(
            controller.skillActivity.value,
            controller.personalInfoOptions,
            Icons.keyboard_arrow_down,
            onChanged: (value) => controller.updatePersonalInfoType(value),
          ),
        ),
        SizedBox(height: 16.h),
        _buildTextField(
          'Skills :',
          controller.skillsController,
          'Enter Your Skills',
        ),
        SizedBox(height: 16.h),
        _buildTextField(
          'Extra Curricular Activity :',
          controller.nameController,
          'Enter Your Extra Curricular Activity',
        ),
        SizedBox(height: 16.h),
        _buildTextField(
          'Hobbies :',
          controller.nameController,
          'Enter Your Hobbies',
        ),
      ],
    );
  }

  Widget _buildPortfolioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "Portfolio",
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
        SizedBox(height: 16.h),

        CommonText(text: "Portfolio Url : "),
        SizedBox(height: 12.h),
        Obx(
          () => _buildDropdownField(
            controller.portfolioUrl.value,
            controller.personalInfoOptions,
            Icons.keyboard_arrow_down,
            onChanged: (value) => controller.updatePersonalInfoType(value),
          ),
        ),
        SizedBox(height: 12.h),
        Align(
          alignment: Alignment.topRight,
          child: CommonButton(
            titleText: "Add More",
            buttonWidth: 150.w,
            buttonHeight: 38.h,
            titleSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      children: [
        // Back Button
        Expanded(
          child: CommonButton(
            titleText: 'Back',
            onTap: () => _navigateBack(),
            // You can add different styling for back button if needed
          ),
        ),
        SizedBox(width: 16.w),
        // Finish Button
        Expanded(
          child: CommonButton(
            titleText: 'Finish & Save',
            onTap: () => _finishAndSave(),
          ),
        ),
      ],
    );
  }

  void _navigateBack() {
    controller.currentStep.value = 0;
    Get.back();
  }

  void _finishAndSave() {
    // Validate step 2 data
    if (_validateStep2()) {
      controller.saveResume();
      // Get.back();
      // Get.back(); // Go back to the original screen or dashboard
      Get.toNamed(AppRoutes.jobSeekerDashboard);
      Get.snackbar(
        'Success',
        'CV/Resume created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  bool _validateStep2() {
    // Add your validation logic here
    return true;
  }

  Widget _buildDropdownField(
    String value,
    List<String> items,
    IconData icon, {
    required Function(String) onChanged,
  }) {
    return GestureDetector(
      onTap: () => _showDropdownModal(items, onChanged),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 16.sp, color: AppColors.black),
            ),
            Icon(icon, color: Colors.grey, size: 20.w),
          ],
        ),
      ),
    );
  }

  void _showDropdownModal(List<String> items, Function(String) onChanged) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: items
              .map(
                (item) => ListTile(
                  title: Text(item),
                  onTap: () {
                    onChanged(item);
                    Get.back();
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController textController,
    String hintText, {
    bool isDate = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        SizedBox(height: 8.h),
        CommonTextField(
          controller: textController,
          hintText: hintText,
          maxLines: maxLines,
          suffixIcon: isDate
              ? Icon(Icons.calendar_today, size: 20, color: Colors.grey[600])
              : null,
          onTap: isDate ? () => _showDatePicker(textController) : null,
        ),
      ],
    );
  }

  void _showDatePicker(TextEditingController textController) async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      textController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }
}
