import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/pop_up/job_application_popup.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';

class ViewJobDetailsScreen extends StatelessWidget {
  const ViewJobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: 'Job Details'),
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
        Row(
          children: [
            Icon(Icons.business, color: AppColors.black, size: 24.sp),
            SizedBox(width: 16.w),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: 'Google',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 4.w),
                  CommonText(
                    text: '\$200 / Monthly',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        CommonText(
          text: '🩺 Senior Business Analytics',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.blue500,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 16.sp),
                SizedBox(width: 6.w),
                CommonText(
                  text: 'XYZ Hospital, 123 Main Street',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: AppColors.textFiledColor,
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.access_time_outlined, size: 16.sp),
                SizedBox(width: 6.w),
                CommonText(
                  text: '20 Jan 2025',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: AppColors.textFiledColor,
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 8.h),
        Row(
          children: [
            Icon(Icons.place_outlined, size: 16.sp),
            SizedBox(width: 6.w),
            CommonText(
              text: 'Distance : 5km',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              textAlign: TextAlign.left,
            ),
          ],
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
        Expanded(
          child: _buildButton('Save', () {
            // Handle save action
          }),
        ),
        SizedBox(width: 24.w),
        Expanded(
          child: _buildButton('Apply Now', () {
            // Show job application popup
            Get.dialog(
              const JobApplicationPopup(
                jobTitle: 'Senior Business Analytics',
                companyName: 'Google',
              ),
            );
          }, isGradient: true),
        ),
      ],
    );
  }

  Widget _buildButton(
    String text,
    VoidCallback onTap, {
    bool isGradient = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isGradient ? null : AppColors.white,
        gradient: isGradient
            ? const LinearGradient(
                begin: Alignment(-0.9, 0),
                end: Alignment(1.0, 0),
                colors: [
                  Color(0xFF083E4B), // #083E4B
                  Color(0xFF074E5E), // #074E5E
                  Color(0xFF0288A6), // #0288A6
                ],
                stops: [0.0, 0.4, 1.0],
              )
            : null,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            height: 50.h,
            width: double.infinity,
            alignment: Alignment.center,
            child: CommonText(
              text: text,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isGradient ? AppColors.white : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
