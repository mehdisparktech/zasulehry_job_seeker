import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/component/card/job_card.dart';
import 'package:zasulehry_job_seeker/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/utils/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/utils/constants/app_images.dart';

class JobSeekerHomeScreen extends StatelessWidget {
  const JobSeekerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Job Seeker Home',
        subtitle: 'subtitle',
        isShowBackButton: false,
        isCenterTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 10,
            child: const CommonImage(
              imageSrc: AppImages.noImage,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 10,
          itemBuilder: (context, index) => JobCard(
            companyName: 'Google',
            location: 'California, USA',
            jobTitle: 'Senior Business Analyst',
            salaryRange: '\$200-\$300/Month',
            timePosted: '2 Days Ago',
            isFullTime: true,
            companyLogo: 'G',
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 0),
    );
  }
}
