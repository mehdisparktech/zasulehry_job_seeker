import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/controller/job_seeker_home_controller.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/extensions/extension.dart';

class EditWorkInformationScreen extends StatefulWidget {
  const EditWorkInformationScreen({super.key});

  @override
  State<EditWorkInformationScreen> createState() =>
      _EditWorkInformationScreenState();
}

class _EditWorkInformationScreenState extends State<EditWorkInformationScreen> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController subCategoryController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController workOverviewController = TextEditingController();
  final JobSeekerHomeController jobSeekerHomeController =
      Get.put<JobSeekerHomeController>(JobSeekerHomeController());

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
                hintText: "12 Years 6 Months",
                fillColor: AppColors.white,
                borderColor: AppColors.background,
                textColor: AppColors.black,
                keyboardType: TextInputType.text,
              ),

              16.height,

              _buildSalarySection(jobSeekerHomeController),
              16.height,

              // Salary Field
              //_buildSectionLabel("Enter your Salary"),
              CommonTextField(
                controller: salaryController,
                hintText: "\$250",
                keyboardType: TextInputType.phone,
                fillColor: AppColors.white,
                borderColor: AppColors.background,
                textColor: AppColors.black,
              ),
              24.height,
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.snackbar(
                      "Info",
                      "Add more images functionality will be implemented",
                      backgroundColor: AppColors.primaryColor,
                      colorText: AppColors.white,
                      duration: const Duration(seconds: 1),
                    );
                  },
                  child: Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30.r),
                      gradient: LinearGradient(
                        begin: Alignment(-0.9, 0),
                        end: Alignment(1.0, 0),
                        colors: [
                          Color(0xFF083E4B), // #083E4B
                          Color(0xFF074E5E), // #074E5E
                          Color(0xFF0288A6), // #0288A6
                        ],
                      ),
                    ),
                    child: Center(
                      child: CommonText(
                        text: 'Add Other',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),

              16.height,

              // Resume Section
              // _buildSectionLabel("Resume"),
              _buildResumeUploadSection(),

              16.height,

              // Attachment (Image) Section
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
                titleText: "Confirm",
                onTap: () {
                  // Handle edit information
                  Get.snackbar(
                    "Success",
                    "Work information updated successfully",
                    backgroundColor: AppColors.primaryColor,
                    colorText: AppColors.white,
                    duration: const Duration(seconds: 1),
                  );
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
      fontSize: 14,
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

  // ignore: unused_element
  Widget _buildFormField({
    required String label,
    required String hintText,
    TextEditingController? controller,
    bool isDropdown = false,
    VoidCallback? onTap,
    Widget? suffixIcon,
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
        8.height,
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.textFiledColor.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: isDropdown
              ? GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: hintText,
                          fontSize: 14,
                          color: AppColors.textFiledColor,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.textFiledColor,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                )
              : TextField(
                  controller: controller,
                  style: TextStyle(color: AppColors.black, fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: AppColors.textFiledColor,
                      fontSize: 14.sp,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 15.h,
                    ),
                    suffixIcon: suffixIcon,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildResumeUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Upload Resume',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        12.height,
        // Upload Resume Button
        GestureDetector(
          onTap: () {
            Get.snackbar(
              "Info",
              "Resume upload functionality will be implemented",
              backgroundColor: AppColors.primaryColor,
              colorText: AppColors.white,
              duration: const Duration(seconds: 1),
            );
          },
          child: Container(
            height: 80.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.3),
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonImage(imageSrc: AppImages.upload),
                8.width,
                CommonText(
                  text: 'Upload Resume',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
        24.height,
        // Existing PDF Display
        Row(
          children: [
            CommonImage(imageSrc: AppImages.pdf),
            12.width,
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
                Get.snackbar(
                  "Info",
                  "Download functionality will be implemented",
                  backgroundColor: AppColors.primaryColor,
                  colorText: AppColors.white,
                  duration: const Duration(seconds: 1),
                );
              },
              child: Row(
                children: [
                  CommonImage(imageSrc: AppImages.view),
                  16.width,
                  CommonImage(imageSrc: AppImages.download),
                ],
              ),
            ),
          ],
        ),
        20.height,
        // Add Other Button
        CommonButton(
          titleText: 'InApp CV/Resume Creation',
          onTap: () {
            Get.toNamed(AppRoutes.cvCreateStep1);
          },
          buttonRadius: 8.r,
          buttonHeight: 40.h,
        ),
      ],
    );
  }

  Widget _buildImageAttachmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Attachment',
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        12.height,
        // Upload Documents Button
        GestureDetector(
          onTap: () {
            Get.snackbar(
              "Info",
              "Document upload functionality will be implemented",
              backgroundColor: AppColors.primaryColor,
              colorText: AppColors.white,
              duration: const Duration(seconds: 1),
            );
          },
          child: Container(
            height: 80.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.3),
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonImage(
                  imageSrc: AppImages.upload,
                  width: 24.w,
                  height: 24.h,
                ),
                8.width,
                CommonText(
                  text: 'Upload Documents',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
        12.height,
        // Image Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.w,
            childAspectRatio: 1,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.snackbar(
                  "Info",
                  "Image upload functionality will be implemented",
                  backgroundColor: AppColors.primaryColor,
                  colorText: AppColors.white,
                  duration: const Duration(seconds: 1),
                );
              },
              child: Container(
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
        ),
        10.height,
        // Add More Button
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Get.snackbar(
                "Info",
                "Add more images functionality will be implemented",
                backgroundColor: AppColors.primaryColor,
                colorText: AppColors.white,
                duration: const Duration(seconds: 1),
              );
            },
            child: Container(
              height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30.r),
                gradient: LinearGradient(
                  begin: Alignment(-0.9, 0),
                  end: Alignment(1.0, 0),
                  colors: [
                    Color(0xFF083E4B), // #083E4B
                    Color(0xFF074E5E), // #074E5E
                    Color(0xFF0288A6), // #0288A6
                  ],
                ),
              ),
              child: Center(
                child: CommonText(
                  text: 'Add More',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextArea({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      height: 120.h,
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
