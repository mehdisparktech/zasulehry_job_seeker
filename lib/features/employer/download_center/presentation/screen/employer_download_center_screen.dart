import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';

class EmployerDownloadCenterScreen extends StatelessWidget {
  const EmployerDownloadCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Download Center', isCenterTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            _buildDownloadItem(
              title: 'From 01',
              onDownload: () {
                // Handle download for Form 01
                _handleDownload('Form 01');
              },
            ),
            SizedBox(height: 16.h),
            _buildDownloadItem(
              title: 'From 02',
              onDownload: () {
                // Handle download for Form 02
                _handleDownload('Form 02');
              },
            ),
            SizedBox(height: 16.h),
            _buildDownloadItem(
              title: 'From 03',
              onDownload: () {
                // Handle download for Form 03
                _handleDownload('Form 03');
              },
            ),
            SizedBox(height: 16.h),
            _buildDownloadItem(
              title: 'From 04',
              onDownload: () {
                // Handle download for Form 04
                _handleDownload('Form 04');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadItem({
    required String title,
    required VoidCallback onDownload,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.blue500, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          GestureDetector(
            onTap: onDownload,
            child: CommonImage(imageSrc: AppImages.download),
          ),
        ],
      ),
    );
  }

  void _handleDownload(String formName) {
    // Add your download logic here
    // For now, this is a placeholder
    print('Downloading $formName');
    // You can add actual download functionality like:
    // - Open URL
    // - Download file
    // - Show download progress
    // - Save to device storage
  }
}
