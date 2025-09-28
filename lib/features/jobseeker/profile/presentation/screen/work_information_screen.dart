import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/extensions/extension.dart';

class WorkInformationScreen extends StatefulWidget {
  const WorkInformationScreen({super.key});

  @override
  State<WorkInformationScreen> createState() => _WorkInformationScreenState();
}

class _WorkInformationScreenState extends State<WorkInformationScreen> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController subCategoryController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController workOverviewController = TextEditingController();

  String? selectedCategory;
  String? selectedSubCategory;

  final List<String> categories = [
    'Technology',
    'Healthcare',
    'Finance',
    'Education',
    'Marketing',
    'Sales',
    'Design',
    'Other',
  ];

  final List<String> subCategories = [
    'Software Development',
    'Data Science',
    'UI/UX Design',
    'Project Management',
    'Quality Assurance',
    'DevOps',
    'Other',
  ];

  @override
  void dispose() {
    categoryController.dispose();
    subCategoryController.dispose();
    experienceController.dispose();
    salaryController.dispose();
    aboutController.dispose();
    workOverviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Work Information"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Dropdown
              _buildSectionLabel("Category"),
              _buildDropdown(
                hint: "Category",
                value: selectedCategory,
                items: categories,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),

              16.height,

              // Sub Category Dropdown
              _buildSectionLabel("Sub Category"),
              _buildDropdown(
                hint: "Category",
                value: selectedSubCategory,
                items: subCategories,
                onChanged: (value) {
                  setState(() {
                    selectedSubCategory = value;
                  });
                },
              ),

              16.height,

              // Experience Field
              _buildSectionLabel("Experience"),
              CommonTextField(
                controller: experienceController,
                hintText: "12 Years",
                fillColor: AppColors.white,
                borderColor: AppColors.background,
                textColor: AppColors.black,
              ),

              16.height,

              // Salary Field
              _buildSectionLabel("Salary (Monthly)"),
              CommonTextField(
                controller: salaryController,
                hintText: "\$250",
                keyboardType: TextInputType.number,
                fillColor: AppColors.white,
                borderColor: AppColors.background,
                textColor: AppColors.black,
              ),

              16.height,

              // Resume Section
              _buildSectionLabel("Resume"),
              _buildResumeSection(),

              16.height,

              // Attachment (Image) Section
              _buildSectionLabel("Attachment (Image)"),
              _buildImageAttachmentSection(),

              16.height,

              // About Myself Section
              _buildSectionLabel("About Myself"),
              _buildTextArea(
                controller: aboutController,
                hintText: "Type Here",
              ),

              16.height,

              // Work Overview Section
              _buildSectionLabel("Work Overview"),
              _buildTextArea(
                controller: workOverviewController,
                hintText: "Type Here",
              ),

              40.height,

              // Edit Information Button
              CommonButton(
                titleText: "Edit Information",
                onTap: () {
                  // Handle edit information
                  // Get.snackbar(
                  //   "Success",
                  //   "Work information updated successfully",
                  //   backgroundColor: AppColors.primaryColor,
                  //   colorText: AppColors.white,
                  // );
                  Get.toNamed(AppRoutes.editWorkInformation);
                },
              ),

              20.height,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return CommonText(
      text: label,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
      bottom: 8,
    );
  }

  Widget _buildDropdown({
    required String hint,
    String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.background),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          hint: CommonText(
            text: hint,
            color: AppColors.textFiledColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textFiledColor,
          ),
          items: items
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: CommonText(
                    text: e,
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildResumeSection() {
    return Column(
      children: [
        // Upload Resume Button
        SizedBox(height: 12.h),

        // Example PDF Display
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              CommonImage(imageSrc: AppImages.pdf),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Example Pdf',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    CommonText(
                      text: '01.12.2024',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textFiledColor,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle download
                  Get.snackbar(
                    "Info",
                    "Download functionality will be implemented",
                    backgroundColor: AppColors.primaryColor,
                    colorText: AppColors.white,
                  );
                },
                child: CommonImage(imageSrc: AppImages.download),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageAttachmentSection() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.w,
        childAspectRatio: 1,
      ),
      itemCount: 8, // 6 placeholder boxes as shown in image
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            height: 20,
            width: 40.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.textFiledColor.withOpacity(0.3),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextArea({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.textFiledColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        controller: controller,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        style: TextStyle(color: AppColors.black, fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.textFiledColor,
            fontSize: 14.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12.w),
        ),
      ),
    );
  }
}
