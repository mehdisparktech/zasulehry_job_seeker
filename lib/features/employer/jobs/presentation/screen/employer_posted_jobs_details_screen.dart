import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/employer/jobs/presentation/screen/applied_seekers_screen.dart';

class EmployerPostedJobsDetailsScreen extends StatelessWidget {
  const EmployerPostedJobsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppBar(title: 'View Details'),
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
          _buildJobHeader(),
          SizedBox(height: 24.h),
          _buildJobDescription(),
          SizedBox(height: 24.h),
          _buildResponsibilities(),
          SizedBox(height: 24.h),
          _buildQualifications(),
          SizedBox(height: 40.h),
          _buildActionButtons(),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildJobHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Company header with logo, name, salary and verification
        Row(
          children: [
            // Google logo (using G icon)
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: CommonText(
                  text: 'G',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: 'Google',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  Row(
                    children: [
                      CommonText(
                        text: '\$200 / Monthly',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      SizedBox(width: 8.w),
                      // Verification badge
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Job title with emoji and "likes" count
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CommonText(
                text: '🩺 Senior Business Analytics',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blue500,
              ),
            ),
            CommonText(
              text: '20 Likes',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textFiledColor,
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Location, date and applications count
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16.sp,
                    color: AppColors.textFiledColor,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: CommonText(
                      text: 'XYZ Hospital, 123 Main Street',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textFiledColor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Row(
              children: [
                Icon(
                  Icons.access_time_outlined,
                  size: 16.sp,
                  color: AppColors.textFiledColor,
                ),
                SizedBox(width: 4.w),
                CommonText(
                  text: '20 Jan 2025',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textFiledColor,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // Applications count badge
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Get.to(() => const AppliedSeekersScreen());
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: CommonText(
                text: '4 Applied',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJobDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Job Description',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        CommonText(
          text:
              'We Are Seeking A Compassionate Nurse To Join Our Growing Department, Providing Quality Care To Patients In A Fast-Paced Environment.',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
          textAlign: TextAlign.left,
          maxLines: 10,
        ),
      ],
    );
  }

  Widget _buildResponsibilities() {
    final responsibilities = [
      'Patient Care: Provide Direct Care To Patients, Monitor Vital Signs, Administer Medications, Etc.',
      'Documentation: Maintain Patient Records And Ensure They Are Up To Date.',
      'Collaboration: Work Closely With Doctors, Nurses, And Healthcare Teams.',
      'Emergency Response: Respond Quickly To Patient Needs And Emergencies.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Responsibilities',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        ...responsibilities.map(
          (responsibility) => _buildBulletPoint(responsibility),
        ),
      ],
    );
  }

  Widget _buildQualifications() {
    final qualifications = [
      'Education: Bachelor\'s Degree In Nursing (BSN)" Or "Associate Degree In Nursing (ADN)".',
      'Certifications: Certified Nursing Assistant (CNA)" Or "Board-Certified In Pediatrics.',
      'Experience: "2+ Years Of Experience In A Hospital Setting Preferred."',
      'Skills: Strong Communication Skills, Attention To Detail, Critical Thinking.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Qualifications',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        ...qualifications.map(
          (qualification) => _buildBulletPoint(qualification),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 6.h),
            width: 6.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CommonText(
              text: text,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              textAlign: TextAlign.left,
              maxLines: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(child: _buildEditButton()),
        SizedBox(width: 16.w),
        Expanded(
          child: CommonButton(
            titleText: 'Withdraw',
            onTap: () {
              // Handle withdraw action
              _showWithdrawConfirmation();
            },
            buttonHeight: 48.h,
            buttonRadius: 24.r,
          ),
        ),
      ],
    );
  }

  Widget _buildEditButton() {
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
            // Handle edit action
            _navigateToEditJob();
          },
          child: Center(
            child: CommonText(
              text: 'Edit Now',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  void _showWithdrawConfirmation() {
    Get.dialog(
      AlertDialog(
        title: CommonText(
          text: 'Withdraw Job Posting',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        content: CommonText(
          text:
              'Are you sure you want to withdraw this job posting? This action cannot be undone.',
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
              // Handle withdraw logic here
              Get.snackbar(
                'Success',
                'Job posting has been withdrawn successfully',
                backgroundColor: AppColors.primaryColor,
                colorText: Colors.white,
              );
            },
            child: CommonText(
              text: 'Withdraw',
              fontSize: 14.sp,
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToEditJob() {
    // Navigate to edit job screen
    Get.snackbar(
      'Edit Job',
      'Navigate to edit job screen',
      backgroundColor: AppColors.primaryColor,
      colorText: Colors.white,
    );
  }
}
