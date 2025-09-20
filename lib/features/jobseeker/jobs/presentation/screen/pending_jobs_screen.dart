import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/card/job_card.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/screen/view_job_details_screen.dart';

class PendingJobsScreen extends StatelessWidget {
  const PendingJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppString.pendingJobs),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) => JobCard(
              companyName: 'Google',
              location: 'California Usa',
              jobTitle: 'Senior Business Analys',
              salaryRange: '\$200-\$300/Month',
              timePosted: '2 Days Ago',
              isFullTime: true,
              companyLogo: AppImages.google,
              onTap: () => Get.to(() => ViewJobDetailsScreen()),
            ),
            separatorBuilder: (context, index) => 16.height,
          ),
        ),
      ),
    );
  }
}
