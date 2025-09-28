import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
      backgroundColor: AppColors.white,
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
                fillColor: AppColors.filledColor,
                borderColor: AppColors.background,
                textColor: AppColors.black,
              ),

              16.height,

              // Salary Field
              _buildSectionLabel("Salary (Hourly/Monthly/Yearly)"),
              CommonTextField(
                controller: salaryController,
                hintText: "\$250",
                keyboardType: TextInputType.number,
                fillColor: AppColors.filledColor,
                borderColor: AppColors.background,
                textColor: AppColors.black,
              ),

              16.height,

              // Resume Section
              _buildSectionLabel("Resume"),
              _buildResumeUploadSection(),

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
                titleText: "Confirm",
                onTap: () {
                  // Handle edit information
                  Get.snackbar(
                    "Success",
                    "Work information updated successfully",
                    backgroundColor: AppColors.primaryColor,
                    colorText: AppColors.white,
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
        color: AppColors.filledColor,
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
            color: AppColors.filledColor,
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
            );
          },
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.filledColor,
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.3),
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: AppColors.primaryColor,
                  size: 20.sp,
                ),
                8.width,
                CommonText(
                  text: 'Upload Resume',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
        12.height,
        // Existing PDF Display
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: AppColors.textFiledColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Center(
                  child: CommonText(
                    text: 'PDF',
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
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
                  );
                },
                child: Icon(
                  Icons.download_outlined,
                  color: AppColors.primaryColor,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
        12.height,
        // Add Other Button
        GestureDetector(
          onTap: () {
            Get.snackbar(
              "Info",
              "Add other resume functionality will be implemented",
              backgroundColor: AppColors.primaryColor,
              colorText: AppColors.white,
            );
          },
          child: Container(
            height: 40.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
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
      ],
    );
  }

  Widget _buildImageAttachmentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Attachment (Maximum 8 Image)',
          fontSize: 14,
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
            );
          },
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.filledColor,
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.3),
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: AppColors.primaryColor,
                  size: 20.sp,
                ),
                8.width,
                CommonText(
                  text: 'Upload Documents',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
        12.height,
        // Image Grid
        Container(
          height: 120.h,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.w,
              childAspectRatio: 1,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.snackbar(
                    "Info",
                    "Image upload functionality will be implemented",
                    backgroundColor: AppColors.primaryColor,
                    colorText: AppColors.white,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.filledColor,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.textFiledColor.withOpacity(0.3),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add_photo_alternate_outlined,
                      color: AppColors.textFiledColor,
                      size: 24.sp,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        12.height,
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
              );
            },
            child: Container(
              height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8.r),
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
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.filledColor,
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
