import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../controller/profile_controller.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/helpers/other_helper.dart';

class EditProfileAllFiled extends StatelessWidget {
  const EditProfileAllFiled({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// First Name and Last Name Row
        Row(
          children: [
            Expanded(
              child: CommonTextField(
                controller: controller.firstNameController,
                validator: OtherHelper.validator,
                hintText: "First Name",
                keyboardType: TextInputType.text,
                borderRadius: 8,
                paddingHorizontal: 16,
                paddingVertical: 16,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CommonTextField(
                controller: controller.lastNameController,
                validator: OtherHelper.validator,
                hintText: "Last Name",
                keyboardType: TextInputType.text,
                borderRadius: 8,
                paddingHorizontal: 16,
                paddingVertical: 16,
              ),
            ),
          ],
        ),

        SizedBox(height: 16.h),

        /// Phone Number
        CommonTextField(
          controller: controller.phoneNumberController,
          validator: OtherHelper.validator,
          hintText: "Phone Number",
          keyboardType: TextInputType.phone,
          borderRadius: 8,
          paddingHorizontal: 16,
          paddingVertical: 16,
        ),

        SizedBox(height: 16.h),

        /// Category Dropdown
        CommonTextField(
          controller: controller.categoryController,
          hintText: "Category",
          readOnly: true,
          onTap: () => _showCategoryBottomSheet(context),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textFiledColor,
          ),
          borderRadius: 8,
          paddingHorizontal: 16,
          paddingVertical: 16,
        ),

        SizedBox(height: 16.h),

        /// Sub Category Dropdown
        CommonTextField(
          controller: controller.subCategoryController,
          hintText: "Sub Category",
          readOnly: true,
          onTap: () => _showSubCategoryBottomSheet(context),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textFiledColor,
          ),
          borderRadius: 8,
          paddingHorizontal: 16,
          paddingVertical: 16,
        ),

        SizedBox(height: 16.h),

        /// Qualifications Section
        _buildSectionWithAddButton(
          label: "Qualifications",
          onAddTap: () => _showAddQualificationsDialog(context),
        ),

        SizedBox(height: 16.h),

        /// Experience Section
        _buildSectionWithAddButton(
          label: "Experience",
          onAddTap: () => _showAddExperienceDialog(context),
        ),

        SizedBox(height: 16.h),

        /// Salary Field
        CommonTextField(
          controller: controller.salaryController,
          hintText: "Salary Hourly/Monthly/Yearly",
          keyboardType: TextInputType.number,
          borderRadius: 8,
          paddingHorizontal: 16,
          paddingVertical: 16,
        ),

        SizedBox(height: 16.h),

        /// Upload Resume Button
        _buildUploadResumeButton(context),
      ],
    );
  }

  Widget _buildSectionWithAddButton({
    required String label,
    required VoidCallback onAddTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.background),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: onAddTap,
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: AppColors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadResumeButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _uploadResume(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.background),
        ),
        child: Column(
          children: [
            const CommonImage(
              imageSrc: AppImages.upload,
              width: 24,
              height: 24,
            ),
            SizedBox(height: 8.h),
            Text(
              "Upload Resume",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select Category",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            ...[
                  "Software Development",
                  "Marketing",
                  "Sales",
                  "Design",
                  "Finance",
                ]
                .map(
                  (category) => ListTile(
                    title: Text(category),
                    onTap: () {
                      controller.categoryController.text = category;
                      controller.selectedCategory = category;
                      controller.update();
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  void _showSubCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select Sub Category",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            ...[
                  "Frontend Developer",
                  "Backend Developer",
                  "Full Stack",
                  "Mobile Developer",
                ]
                .map(
                  (subCategory) => ListTile(
                    title: Text(subCategory),
                    onTap: () {
                      controller.subCategoryController.text = subCategory;
                      controller.selectedSubCategory = subCategory;
                      controller.update();
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  void _showAddQualificationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Qualification"),
        content: const TextField(
          decoration: InputDecoration(hintText: "Enter qualification"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void _showAddExperienceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Experience"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(decoration: InputDecoration(hintText: "Job Title")),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(hintText: "Company")),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(hintText: "Duration")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void _uploadResume(BuildContext context) {
    OtherHelper.openGalleryForProfile();
    // Implement resume upload functionality
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("Resume upload functionality to be implemented"),
    //   ),
    // );
  }
}
