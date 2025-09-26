import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/glass_effect_icon.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/core/utils/helpers/other_helper.dart';

class CvCreateCompleteScreen extends StatelessWidget {
  const CvCreateCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: "Your CV is 100% Done"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileImageSection(),
              24.height,
              _buildPersonalInformation(),
              10.height,
              _buildAboutYourself(),
              24.height,
              _buildEducationalInformation(),
              24.height,
              _buildWorkExperience(),
              24.height,
              _buildCurrentWorking(),
              24.height,
              _buildSkillsActivities(),
              100.height,
            ],
          ),
        ),
      ),
      bottomSheet: _buildBottomSheet(),
    );
  }

  Widget _buildProfileImageSection() {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            begin: Alignment(-0.9, 0),
            end: Alignment(1.0, 0),
            colors: [Color(0xFF083E4B), Color(0xFF074E5E), Color(0xFF0288A6)],
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: AssetImage(AppImages.profile),
                    ),
                    Positioned(
                      bottom: -8,
                      right: -8,
                      child: GlassEffectIcon(icon: AppImages.camera),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                TextButton(
                  onPressed: () => OtherHelper.openGallery(),
                  child: CommonText(
                    text: 'Upload Image',
                    fontSize: 18.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GlassEffectIcon(icon: AppImages.editFile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Personal Information"),
        20.height,
        _buildInfoRow("Name", "Md Kamran Khan"),
        _buildInfoRow("Email", "examplezadd@gmail.com"),
        _buildInfoRow("Contact", "01333327633"),
        _buildInfoRow("Date Of Birth", "01.02.1992"),
        _buildInfoRow("Age", "20"),
        _buildInfoRow("Permanent Address", "H No/Ro./Area/City"),
        _buildInfoRow("Present Address", "H No/Ro./Area/City"),
        _buildInfoRow("Driving License", "Anu ALAI CI"),
      ],
    );
  }

  Widget _buildAboutYourself() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.height,
        CommonText(text: "About Yourself", fontSize: 18.sp),
        10.height,
        CommonText(
          text:
              "Lorem Ipsum Dolor Sit Amet Consectetur. Ultrices Eu Vitae Bibendum Id At. Mattis Tortor Cursus Viverra Eget Augue Condimentum. Facilisi Eu Vel Non Scelerisque Neque. Massa Massa Egestas Morbi Odio Nunc Sollicitudin. Vitae In R...",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          maxLines: 5,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _buildEducationalInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Educational Information"),
        20.height,
        _buildTitleSubtitle("Exam/Degree Title", "Bachelor Of Science BSC"),
        _buildTitleSubtitle("Institute Name", "Dhaka University"),
        _buildTitleSubtitle("Result Type", "CGPA"),
        _buildTitleSubtitle("Passing Year", "2022"),
      ],
    );
  }

  Widget _buildWorkExperience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Work Experience"),
        20.height,
        _buildTitleSubtitle("Job Title", "UX/UI DESIGNER"),
        _buildTitleSubtitle("Company/Institute Name", "UX/UI DESIGNER"),
        _buildTitleSubtitle("Location", "H No/Ro./Area/City"),
      ],
    );
  }

  Widget _buildCurrentWorking() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Current Working"),
        20.height,
        Row(
          children: [
            CommonText(
              text: "Current Working :",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            8.width,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.blue500,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CommonText(
                text: "Yes",
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        16.height,
        Row(
          children: [
            Expanded(child: _buildTitleSubtitle("From Date", "01.02.2025")),
            Expanded(child: _buildTitleSubtitle("To Date", "01.02.2025")),
          ],
        ),
        _buildTitleSubtitle(
          "Working Details",
          "Lorem Ipsum Dolor Sit Amet Consectetur. Ultrices Eu Vitae Bibendum Id At. Mattis Tortor Cursus Viverra Eget Augue Condimentum. Facilisi Eu Vel Non Scelerisque Neque. Massa Massa Egestas Morbi Odio Nunc Sollicitudin. Vitae In R...",
        ),
        _buildTitleSubtitle("Portfolio URL", "Www.Hbikdbhann.Com"),
      ],
    );
  }

  Widget _buildSkillsActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader("Skills/Activities"),
        20.height,
        _buildTitleSubtitle("Skill", "Ux/Ui/Video Editing, Graphic Design"),
        _buildTitleSubtitle("Extra Curricular Activities", "Blood Donation"),
        _buildTitleSubtitle("Hobbies", "Gaming"),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.backgroundGradient2, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.backgroundGradient2,
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.backgroundGradient2,
            size: 20.w,
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSubtitle(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          4.height,
          CommonText(
            text: subtitle,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140.w,
            child: CommonText(
              text: label,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
              textAlign: TextAlign.left,
            ),
          ),
          CommonText(
            text: ': ',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
          Expanded(
            child: CommonText(
              text: value,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Row(
          children: [
            Expanded(
              child: CommonButton(
                titleText: "Download",
                isGradient: false,
                buttonColor: Colors.white,
                titleColor: AppColors.blue500,
              ),
            ),
            6.width,
            Expanded(child: CommonButton(titleText: "Upload")),
          ],
        ),
      ),
    );
  }
}
