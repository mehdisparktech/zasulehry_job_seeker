import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/utils/constants/app_colors.dart';

class ViewJobDetailsScreen extends StatelessWidget {
  const ViewJobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 4.w),
                  CommonText(
                    text: '\$200 / Monthly',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
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
          fontWeight: FontWeight.w700,
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
                  color: AppColors.black,
                  textAlign: TextAlign.left,
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
          fontWeight: FontWeight.w700,
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
          fontWeight: FontWeight.w700,
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
          fontWeight: FontWeight.w700,
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
          child: CommonButton(
            titleText: 'Save',
            buttonColor: AppColors.white,
            titleColor: AppColors.black,
            titleSize: 16.sp,
            titleWeight: FontWeight.w600,
            buttonRadius: 20,
            buttonHeight: 50.h,
            onTap: () {
              // Handle save action
            },
          ),
        ),
        SizedBox(width: 26.w),
        Expanded(
          flex: 2,
          child: CommonButton(
            titleText: 'Apply Now',
            buttonColor: AppColors.black,
            titleColor: AppColors.white,
            titleSize: 16.sp,
            titleWeight: FontWeight.w600,
            buttonRadius: 20,
            buttonHeight: 50.h,
            onTap: () {
              // Handle apply now action
            },
          ),
        ),
      ],
    );
  }
}
