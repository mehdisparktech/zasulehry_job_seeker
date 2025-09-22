import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/features/employer/jobs/presentation/screen/detailed_profile_screen.dart';

class SeekerProfileScreen extends StatelessWidget {
  final String seekerName;
  final String jobTitle;

  const SeekerProfileScreen({
    super.key,
    required this.seekerName,
    required this.jobTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: seekerName),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          _buildProfileHeader(),
          SizedBox(height: 24.h),
          _buildAboutMe(),
          SizedBox(height: 24.h),
          _buildResume(),
          SizedBox(height: 24.h),
          _buildQualification(),
          SizedBox(height: 24.h),
          _buildAvailability(),
          SizedBox(height: 24.h),
          _buildExpectedSalary(),
          SizedBox(height: 40.h),
          _buildActionButtons(),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        // Profile Avatar
        GestureDetector(
          onTap: () {
            Get.to(
              () => DetailedProfileScreen(
                seekerName: seekerName,
                jobTitle: jobTitle,
              ),
            );
          },
          child: Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blue100,
              border: Border.all(
                color: AppColors.blue500.withOpacity(0.2),
                width: 2,
              ),
            ),
            child: _buildDefaultAvatar(),
          ),
        ),
        SizedBox(width: 16.w),

        // Name, Title and Contact Button
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: seekerName,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                        SizedBox(height: 4.h),
                        CommonText(
                          text: jobTitle,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      // Chat Icon
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.blue500,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      // Contact Button
                      CommonText(
                        text: 'Contact',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue500,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultAvatar() {
    return CircleAvatar(
      radius: 25.r,
      child: ClipOval(
        child: CommonImage(
          imageSrc: AppImages.profile,
          width: 50.w,
          height: 50.h,
          fill: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAboutMe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'About Me',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blue500,
        ),
        SizedBox(height: 12.h),
        CommonText(
          text:
              'Lorem Ipsum Dolor Sit Amet Consectetur. Ultrices Eu Vitae Bibendum Id At. Mattis Tortor Cursus Viverra Eget Augue Condimentum. Facilisi Eu Vel Non Scelerisque Neque. Massa Massa Egestas Morbi Odio Nunc Sollicitudin. Vitae In R...',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          maxLines: 10,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildResume() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Resume',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blue500,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            // PDF Icon
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: CommonText(
                  text: 'PDF',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // File Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Example.pdf',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 2.h),
                  CommonText(
                    text: '01.02.2024',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),

            // Action Icons
            Row(
              children: [
                Icon(
                  Icons.visibility_outlined,
                  color: AppColors.blue500,
                  size: 20.sp,
                ),
                SizedBox(width: 12.w),
                Icon(
                  Icons.download_outlined,
                  color: AppColors.blue500,
                  size: 20.sp,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQualification() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.blue100, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Qualification',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blue500,
          ),
          SizedBox(height: 12.h),

          // Exam/Degree Title
          _buildQualificationRow('Exam/Degree Title', ''),
          SizedBox(height: 8.h),
          CommonText(
            text: 'Bachelor Of Science BSC',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: 16.h),

          // Table Header
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CommonText(
                  text: 'Passing Year',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: CommonText(
                  text: 'Result Type',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Expanded(
                flex: 1,
                child: CommonText(
                  text: 'Result',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // Table Data
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CommonText(
                  text: '2022',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: CommonText(
                  text: 'CGPA',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              Expanded(
                flex: 1,
                child: CommonText(
                  text: '4.06',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQualificationRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120.w,
          child: CommonText(
            text: label,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        CommonText(
          text: value,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textFiledColor,
        ),
      ],
    );
  }

  Widget _buildAvailability() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Availability',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blue500,
        ),
        SizedBox(height: 12.h),
        CommonText(
          text: '07:00AM-08:00 Pm',
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ],
    );
  }

  Widget _buildExpectedSalary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Expected Salary',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blue500,
        ),
        SizedBox(height: 12.h),
        CommonText(
          text: '\$500',
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(child: _buildFeedbackButton()),
        SizedBox(width: 16.w),
        Expanded(
          child: CommonButton(
            titleText: 'Approve',
            onTap: () {
              _showApprovalDialog();
            },
            buttonHeight: 48.h,
            buttonRadius: 24.r,
          ),
        ),
      ],
    );
  }

  Widget _buildFeedbackButton() {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24.r),
          onTap: () {
            _showFeedbackDialog();
          },
          child: Center(
            child: CommonText(
              text: 'Feedback',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  void _showApprovalDialog() {
    Get.dialog(
      AlertDialog(
        title: CommonText(
          text: 'Approve Application',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        content: CommonText(
          text:
              'Are you sure you want to approve $seekerName for this position?',
          fontSize: 14.sp,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: CommonText(
              text: 'Cancel',
              fontSize: 14.sp,
              color: AppColors.textFiledColor,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Success',
                '$seekerName has been approved for the position',
                backgroundColor: AppColors.primaryColor,
                colorText: Colors.white,
              );
            },
            child: CommonText(
              text: 'Approve',
              fontSize: 14.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _showFeedbackDialog() {
    TextEditingController feedbackController = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: CommonText(
          text: 'Provide Feedback',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: 'Please provide feedback for $seekerName:',
              fontSize: 14.sp,
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: feedbackController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter your feedback here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: CommonText(
              text: 'Cancel',
              fontSize: 14.sp,
              color: AppColors.textFiledColor,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Success',
                'Feedback sent to $seekerName',
                backgroundColor: AppColors.primaryColor,
                colorText: Colors.white,
              );
            },
            child: CommonText(
              text: 'Send',
              fontSize: 14.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
