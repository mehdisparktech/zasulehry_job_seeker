import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/card/job_card.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/enum/enum.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/controller/job_seeker_home_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/screen/view_job_details_screen.dart';

class JobOpeningsWidget extends StatelessWidget {
  const JobOpeningsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JobSeekerHomeController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(controller),
          16.height,
          _buildJobList(),
          20.height,
        ],
      ),
    );
  }

  Widget _buildSectionHeader(JobSeekerHomeController controller) {
    return Obx(
      () => CommonText(
        text: 'Job Opening (${controller.jobCount.value})',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.blue500,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildJobList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => JobCard(
        companyName: 'Google',
        location: 'California, Usa',
        jobTitle: 'Senior Business Analys',
        salaryRange: '\$200-\$300/Month',
        timePosted: '2 Days Ago',
        isFullTime: true,
        companyLogo: AppImages.google,
        onTap: () => Get.to(
          () => const ViewJobDetailsScreen(applyJobStatus: ApplyJobStatus.none),
        ),
      ),
      separatorBuilder: (context, index) => 16.height,
    );
  }
}
