import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/employer/jobs/presentation/screen/seeker_profile_screen.dart';

class AppliedSeekersScreen extends StatelessWidget {
  const AppliedSeekersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppBar(title: 'Applied Seekers'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          _buildSeekerCard(
            name: 'Jhon Doe',
            title: 'Senior Business Analytics',
            profileImage: null,
          ),
          SizedBox(height: 16.h),
          _buildSeekerCard(
            name: 'Md Kamran Khan',
            title: 'Senior Business Analytics',
            profileImage: null,
          ),
          SizedBox(height: 16.h),
          _buildSeekerCard(
            name: 'Md Mahbubul',
            title: 'Senior Business Analytics',
            profileImage: null,
          ),
          SizedBox(height: 16.h),
          _buildSeekerCard(
            name: 'Ananto Khan',
            title: 'Senior Business Analytics',
            profileImage: null,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildSeekerCard({
    required String name,
    required String title,
    String? profileImage,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Avatar
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blue100,
              border: Border.all(
                color: AppColors.primaryColor.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: profileImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: Image.network(
                      profileImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildDefaultAvatar(name);
                      },
                    ),
                  )
                : _buildDefaultAvatar(name),
          ),
          SizedBox(width: 16.w),

          // Name and Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: name,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                SizedBox(height: 4.h),
                CommonText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textFiledColor,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // View Button
          GestureDetector(
            onTap: () {
              _viewSeekerProfile(name, title);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: CommonText(
                text: 'View',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar(String name) {
    String initials = '';
    List<String> nameParts = name.split(' ');
    if (nameParts.isNotEmpty) {
      initials = nameParts[0][0].toUpperCase();
      if (nameParts.length > 1) {
        initials += nameParts[1][0].toUpperCase();
      }
    }

    return Center(
      child: CommonText(
        text: initials,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
      ),
    );
  }

  void _viewSeekerProfile(String name, String title) {
    // Navigate to seeker profile screen
    Get.to(() => SeekerProfileScreen(seekerName: name, jobTitle: title));
  }
}
