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

class EmployerPostJobScreen extends StatefulWidget {
  const EmployerPostJobScreen({super.key});

  @override
  State<EmployerPostJobScreen> createState() => _EmployerPostJobScreenState();
}

class _EmployerPostJobScreenState extends State<EmployerPostJobScreen> {
  final TextEditingController deadlineController = TextEditingController();
  final TextEditingController jobDescriptionController =
      TextEditingController();
  final TextEditingController keyResponsibilitiesController =
      TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController aboutOurselfController = TextEditingController();

  String selectedCategory = "Senior Business Analytics";
  String selectedSubCategory = "Senior Business Analytics";

  final List<String> categories = [
    "Senior Business Analytics",
    "Software Engineering",
    "Marketing",
    "Human Resources",
    "Finance",
    "Operations",
  ];

  final List<String> subCategories = [
    "Senior Business Analytics",
    "Junior Business Analytics",
    "Data Science",
    "Business Intelligence",
    "Data Analysis",
  ];

  @override
  void dispose() {
    deadlineController.dispose();
    jobDescriptionController.dispose();
    keyResponsibilitiesController.dispose();
    qualificationController.dispose();
    aboutOurselfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: AppString.postJob,
        isBackButton: true,
        isCenterTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Section
                _buildSectionTitle("Category"),
                SizedBox(height: 8.h),
                _buildDropdownField(
                  value: selectedCategory,
                  items: categories,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
                SizedBox(height: 20.h),

                // Sub Category Section
                _buildSectionTitle("Sub Category"),
                SizedBox(height: 8.h),
                _buildDropdownField(
                  value: selectedSubCategory,
                  items: subCategories,
                  onChanged: (value) {
                    setState(() {
                      selectedSubCategory = value!;
                    });
                  },
                ),
                SizedBox(height: 20.h),

                // Deadline Section
                _buildSectionTitle("Deadline"),
                SizedBox(height: 8.h),
                CommonTextField(
                  controller: deadlineController,
                  hintText: "Type Here...",
                  fillColor: AppColors.white,
                  borderColor: AppColors.background,

                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate != null) {
                      deadlineController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    }
                  },
                ),
                SizedBox(height: 20.h),

                // Job Description Section
                _buildSectionTitle("Job Description"),
                SizedBox(height: 8.h),
                CommonTextField(
                  controller: jobDescriptionController,
                  hintText: "Type here...",
                  fillColor: AppColors.white,
                  borderColor: AppColors.background,
                  mexLength: 500,
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                ),
                SizedBox(height: 20.h),

                // Key Of Responsibilities Section
                _buildSectionTitle("Key Responsibilities"),
                SizedBox(height: 8.h),
                CommonTextField(
                  controller: keyResponsibilitiesController,
                  hintText: "Type Here...",
                  fillColor: AppColors.white,
                  borderColor: AppColors.background,
                  mexLength: 500,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                ),
                SizedBox(height: 8.h),
                CommonTextField(
                  hintText: "Type Here...",
                  fillColor: AppColors.white,
                  borderColor: AppColors.background,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: CommonImage(
                    imageSrc: AppImages.add,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(height: 20.h),

                // Qualification Section
                _buildSectionTitle("Required Qualification"),
                SizedBox(height: 8.h),
                CommonTextField(
                  controller: qualificationController,
                  hintText: "Type Here...",
                  fillColor: AppColors.white,
                  borderColor: AppColors.background,
                  mexLength: 500,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                ),
                SizedBox(height: 8.h),
                CommonTextField(
                  hintText: "Type Here...",
                  fillColor: AppColors.white,
                  borderColor: AppColors.background,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                ),
                SizedBox(height: 8.h),
                CommonTextField(
                  hintText: "Type Here...",
                  fillColor: AppColors.white,
                  borderColor: AppColors.background,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: CommonImage(
                    imageSrc: AppImages.add,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(height: 20.h),

                // About Ourself Section
                _buildSectionTitle("About Ourself"),
                SizedBox(height: 8.h),
                CommonTextField(
                  controller: aboutOurselfController,
                  hintText: "Type here...",
                  fillColor: AppColors.white,
                  borderColor: AppColors.background,
                  mexLength: 500,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                ),
                SizedBox(height: 40.h),

                // Post Now Button
                CommonButton(
                  titleText: "Post Now",
                  onTap: () {
                    _handlePostJob();
                  },
                  buttonHeight: 48.h,
                  titleSize: 16.sp,
                  titleWeight: FontWeight.w500,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return CommonText(
      text: title,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  Widget _buildDropdownField({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.background),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: CommonText(
                text: item,
                fontSize: 14.sp,
                color: AppColors.black,
              ),
            );
          }).toList(),
          onChanged: onChanged,
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.black),
          isExpanded: true,
          style: TextStyle(fontSize: 14.sp, color: AppColors.black),
        ),
      ),
    );
  }

  void _handlePostJob() {
    // Validate required fields
    if (selectedCategory.isEmpty) {
      Get.snackbar("Error", "Please select a category", duration: const Duration(seconds: 1));
      return;
    }

    if (selectedSubCategory.isEmpty) {
      Get.snackbar("Error", "Please select a sub category", duration: const Duration(seconds: 1));
      return;
    }

    if (deadlineController.text.isEmpty) {
      Get.snackbar("Error", "Please select a deadline", duration: const Duration(seconds: 1));
      return;
    }

    if (jobDescriptionController.text.isEmpty) {
      Get.snackbar("Error", "Please enter job description", duration: const Duration(seconds: 1));
      return;
    }

    Get.snackbar(
      'Success',
      'Job posted successfully!',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
      duration: const Duration(seconds: 1),
    );

    // Navigate back to dashboard
    Get.back();
  }
}
