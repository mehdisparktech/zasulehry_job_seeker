import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/utils/helpers/other_helper.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/app_colors.dart';
import '../controller/profile_controller.dart';
import '../../../../../core/constants/app_string.dart';

class CreateProfileSecound extends StatelessWidget {
  const CreateProfileSecound({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.background,

          /// App Bar Sections Starts here
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: const CommonText(
              text: AppString.createProfile,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),

          /// Body Sections Starts here
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Attachment Section
                _buildSectionTitle("Attachment"),
                SizedBox(height: 16.h),

                /// Upload Documents Card
                _buildUploadDocumentsCard(),
                SizedBox(height: 16.h),

                /// Grid of placeholder cards
                _buildPlaceholderGrid(),
                SizedBox(height: 16.h),

                /// Add More Button
                _buildAddMoreButton(),
                SizedBox(height: 24.h),

                /// About Yourself Section
                _buildSectionTitle("About Your Self"),
                SizedBox(height: 16.h),
                _buildTextArea(
                  controller: controller.aboutYourselfController,
                  hintText: "Type Here",
                ),
                SizedBox(height: 24.h),

                /// Work Overview Section
                _buildSectionTitle("Work Overview"),
                SizedBox(height: 16.h),
                _buildTextArea(
                  controller: controller.workOverviewController,
                  hintText: "Type Here",
                ),
                SizedBox(height: 16.h),

                /// Add Other Button
                _buildAddOtherButton(context),
                SizedBox(height: 16.h),

                /// Confirm Button
                _buildConfirmButton(controller),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return CommonText(
      text: title,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
      textAlign: TextAlign.left,
    );
  }

  Widget _buildUploadDocumentsCard() {
    return GestureDetector(
      onTap: () {
        OtherHelper.openGalleryForProfile();
      },
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CommonImage(
              imageSrc: AppImages.upload,
              width: 32,
              height: 32,
              imageColor: AppColors.primaryColor,
            ),
            SizedBox(height: 8.h),
            CommonText(
              text: "Upload Documents",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderGrid() {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 1.0,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            OtherHelper.openGalleryForProfile();
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddMoreButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          OtherHelper.openGalleryForProfile();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: LinearGradient(
              begin: Alignment(-0.9, 0),
              end: Alignment(1.0, 0),
              colors: [Color(0xFF083E4B), Color(0xFF074E5E), Color(0xFF0288A6)],
              stops: [0.0, 0.4, 1.0],
            ),
          ),
          child: CommonText(
            text: "Add More",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTextArea({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        style: TextStyle(fontSize: 16.sp, color: AppColors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16.sp, color: AppColors.textSecondary),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.w),
        ),
      ),
    );
  }

  Widget _buildAddOtherButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => _showAddOtherDialog(context),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: AppColors.blue500, width: 2),
          ),
          child: CommonText(
            text: "Add Other",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blue500,
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton(ProfileController controller) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.9, 0),
          end: Alignment(1.0, 0),
          colors: [Color(0xFF083E4B), Color(0xFF074E5E), Color(0xFF0288A6)],
          stops: [0.0, 0.4, 1.0],
        ),
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28.r),
          onTap: () {
            Get.toNamed(AppRoutes.jobSeekerHome);
          },
          child: Center(
            child: CommonText(
              text: "Confirm",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _showAddOtherDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return GetBuilder<ProfileController>(
          builder: (controller) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title Section
                      CommonText(
                        text: "Title",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 12.h),

                      /// Title Input Field
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.textSecondary),
                        ),
                        child: TextField(
                          controller: controller.titleController,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter Tittle",
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.textSecondary,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16.w),
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      /// Features Section
                      CommonText(
                        text: "Features",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 12.h),

                      /// Features Input Field with Add Button
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.textSecondary),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: controller.featuresController,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Type Here...",
                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(16.w),
                                ),
                              ),
                            ),

                            /// Add Button
                            GestureDetector(
                              onTap: () => _addFeature(controller),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CommonImage(imageSrc: AppImages.add),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 32.h),

                      /// Submit Button
                      Container(
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(-0.9, 0),
                            end: Alignment(1.0, 0),
                            colors: [
                              Color(0xFF083E4B),
                              Color(0xFF074E5E),
                              Color(0xFF0288A6),
                            ],
                            stops: [0.0, 0.4, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(24.r),
                            onTap: () => _submitAddOther(controller, context),
                            child: Center(
                              child: CommonText(
                                text: "Submit",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _addFeature(ProfileController controller) {
    // Add feature logic here
    String currentText = controller.featuresController.text;
    if (currentText.isNotEmpty) {
      controller.featuresController.text = "$currentText, ";
    }
    controller.featuresController.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.featuresController.text.length),
    );
  }

  void _submitAddOther(ProfileController controller, BuildContext context) {
    // Handle submit logic here
    String title = controller.titleController.text;
    String features = controller.featuresController.text;

    if (title.isNotEmpty || features.isNotEmpty) {
      // Process the data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Title: $title\nFeatures: $features"),
          backgroundColor: AppColors.primaryColor,
        ),
      );

      // Clear controllers
      controller.titleController.clear();
      controller.featuresController.clear();

      // Close dialog
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter at least one field"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
