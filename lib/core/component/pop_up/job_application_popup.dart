import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';

class JobApplicationPopup extends StatefulWidget {
  final String jobTitle;
  final String companyName;
  final VoidCallback? onSubmit;

  const JobApplicationPopup({
    super.key,
    required this.jobTitle,
    required this.companyName,
    this.onSubmit,
  });

  @override
  State<JobApplicationPopup> createState() => _JobApplicationPopupState();
}

class _JobApplicationPopupState extends State<JobApplicationPopup> {
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _availabilityController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  @override
  void dispose() {
    _aboutController.dispose();
    _qualificationController.dispose();
    _availabilityController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: 'Apply To ${widget.companyName}',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.close,
                      color: AppColors.black,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            Divider(
              height: 1.h,
              color: AppColors.textFiledColor.withOpacity(0.3),
            ),

            // Form content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tell Us About Yourself section
                    CommonText(
                      text: 'Tell Us About Yourself ?',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textFiledColor.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextField(
                        controller: _aboutController,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText: 'Type ...',
                          hintStyle: TextStyle(
                            color: AppColors.textFiledColor,
                            fontSize: 14.sp,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12.w),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Upload Resume section
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textFiledColor.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_file,
                            color: AppColors.primaryColor,
                            size: 20.sp,
                          ),
                          SizedBox(width: 8.w),
                          CommonText(
                            text: 'Upload Resume',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Example PDF section
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.textFiledColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
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
                                  text: '01.02.2024',
                                  fontSize: 12,
                                  color: AppColors.textFiledColor,
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.download,
                            color: AppColors.primaryColor,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // CV Creation button
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: CommonText(
                          text: 'Percenter Cv/Resume Creation',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Qualification section
                    CommonText(
                      text: 'Qualification',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textFiledColor.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextField(
                        controller: _qualificationController,
                        decoration: InputDecoration(
                          hintText: 'Type ...',
                          hintStyle: TextStyle(
                            color: AppColors.textFiledColor,
                            fontSize: 14.sp,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12.w),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Availability section
                    CommonText(
                      text: 'Availability',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textFiledColor.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextField(
                        controller: _availabilityController,
                        decoration: InputDecoration(
                          hintText: 'Type ...',
                          hintStyle: TextStyle(
                            color: AppColors.textFiledColor,
                            fontSize: 14.sp,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12.w),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Expected Salary section
                    CommonText(
                      text: 'Your Expected Salary ?',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textFiledColor.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextField(
                        controller: _salaryController,
                        decoration: InputDecoration(
                          hintText: 'Type ...',
                          hintStyle: TextStyle(
                            color: AppColors.textFiledColor,
                            fontSize: 14.sp,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12.w),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // Submit button
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryColor,
                            AppColors.primaryColor.withOpacity(0.8),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.r),
                          onTap: () {
                            Get.back();
                            if (widget.onSubmit != null) {
                              widget.onSubmit!();
                            }
                            Get.snackbar(
                              'Success',
                              'Application submitted successfully!',
                              backgroundColor: AppColors.primaryColor,
                              colorText: AppColors.white,
                            );
                          },
                          child: Center(
                            child: CommonText(
                              text: 'Submit Now',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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
          ],
        ),
      ),
    );
  }
}
