import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';

class DetailedProfileScreen extends StatelessWidget {
  final String seekerName;
  final String jobTitle;

  const DetailedProfileScreen({
    super.key,
    required this.seekerName,
    required this.jobTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppBar(title: 'View Profile'),
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
          _buildPersonalInformation(),
          SizedBox(height: 24.h),
          _buildWorkInformation(),
          SizedBox(height: 24.h),
          _buildAttachmentImages(),
          SizedBox(height: 24.h),
          _buildWorkOverview(),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          // Profile Image
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blue100,
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.2),
                width: 3,
              ),
            ),
            child: _buildDefaultAvatar(),
          ),
          SizedBox(height: 16.h),

          // Name
          CommonText(
            text: seekerName,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return CircleAvatar(
      radius: 25.r,
      child: ClipOval(
        child: CommonImage(
          imageSrc: AppImages.profile,
          width: 100.w,
          height: 100.h,
          fill: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPersonalInformation() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue100, width: 1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonText(
            text: 'Personal Information',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blue500,
          ),
          SizedBox(height: 16.h),
          _buildInfoRow('Name', 'Example Name'),
          SizedBox(height: 12.h),
          _buildInfoRow('Email', 'Example@Gmail.Com'),
          SizedBox(height: 12.h),
          _buildInfoRow('Contact', '+15352832128'),
          SizedBox(height: 12.h),
          _buildInfoRow('Location', 'Dhaka Bangladesh'),
          SizedBox(height: 12.h),
          _buildInfoRow('Role', 'Job Seeker'),
        ],
      ),
    );
  }

  Widget _buildWorkInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Work Information',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blue500,
        ),
        SizedBox(height: 16.h),

        // Category
        _buildWorkInfoRow('Category', 'Senior Business Analytics'),
        SizedBox(height: 12.h),

        // Experience
        _buildWorkInfoRow('Experience', '12 Years'),
        SizedBox(height: 16.h),

        // Resume/CV Section
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

  Widget _buildWorkInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.w,
          child: CommonText(
            text: label,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        CommonText(
          text: ': ',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        Expanded(
          child: CommonText(
            text: value,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w,
          child: CommonText(
            text: label,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            textAlign: TextAlign.start,
          ),
        ),
        CommonText(
          text: ': ',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        Expanded(
          child: CommonText(
            text: value,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget _buildAttachmentImages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Attachment (Image)',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        SizedBox(height: 16.h),

        // Image Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 1,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return _buildImagePlaceholder();
          },
        ),
      ],
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.filledColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.image_outlined,
          color: AppColors.textFiledColor,
          size: 24.sp,
        ),
      ),
    );
  }

  Widget _buildWorkOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Work Overview',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        SizedBox(height: 12.h),
        CommonText(
          text:
              'Lorem Ipsum Dolor Sit Amet Consectetur. Ultrices Eu Vitae Bibendum Id At. Mattis Tortor Cursus Viverra Eget Augue Condimentum. Facilisi Eu Vel Non Scelerisque Neque. Massa Massa Egestas Morbi Odio Nunc Sollicitudin. Vitae In R...',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
          maxLines: 10,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
