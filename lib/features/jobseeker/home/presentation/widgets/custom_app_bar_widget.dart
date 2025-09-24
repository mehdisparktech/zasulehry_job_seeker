import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/glass_effect_icon.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.9, 0),
            end: Alignment(1.0, 0),
            colors: [
              Color(0xFF083E4B), // #083E4B
              Color(0xFF074E5E), // #074E5E
              Color(0xFF0288A6), // #0288A6
            ],
            stops: [0.0, 0.4, 1.0],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      title: _buildTitle(),
      centerTitle: false,
      leading: _buildLeading(),
      actions: [_buildNotificationButton()],
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: "Welcome To JobsinApp",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        CommonText(
          text: 'John Doe',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ],
    );
  }

  Widget _buildLeading() {
    return Padding(
      padding: EdgeInsets.only(left: 14.w),
      child: CircleAvatar(
        radius: 25.r,
        child: ClipOval(
          child: CommonImage(
            imageSrc: AppImages.profile,
            width: 50.w,
            height: 50.h,
            fill: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.notifications);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 14.w),
        child: GlassEffectIcon(icon: AppImages.notification),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
