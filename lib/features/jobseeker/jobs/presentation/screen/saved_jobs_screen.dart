import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/card/job_card.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/enum/enum.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/screen/view_job_details_screen.dart';

class SavedJobsScreen extends StatelessWidget {
  const SavedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppString.savedJobs),
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
              onTap: () => Get.to(
                () =>
                    ViewJobDetailsScreen(applyJobStatus: ApplyJobStatus.saved),
              ),
            ),
            separatorBuilder: (context, index) => 16.height,
          ),
        ),
      ),
    );
  }
}
