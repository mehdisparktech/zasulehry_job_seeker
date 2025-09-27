import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/glass_effect_icon.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/enum/enum.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/controller/view_job_details_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/widgets/job_header_widget.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/widgets/job_description_widget.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/widgets/job_responsibilities_widget.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/widgets/job_qualifications_widget.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/widgets/job_action_buttons_widget.dart';

class ViewJobDetailsScreen extends StatelessWidget {
  final ApplyJobStatus applyJobStatus;

  const ViewJobDetailsScreen({super.key, required this.applyJobStatus});

  @override
  Widget build(BuildContext context) {
    // Initialize controller with the apply job status
    final controller = ViewJobDetailsController.instance;
    controller.setApplyJobStatus(applyJobStatus);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        title: 'View Details',
        actions: applyJobStatus == ApplyJobStatus.approved
            ? [
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: GlassEffectIcon(
                    icon: AppImages.whatsapp,
                    onTap: () {},
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ]
            : [],
      ),
      body: _buildBody(controller),
    );
  }

  Widget _buildBody(ViewJobDetailsController controller) {
    return Obx(() {
      if (controller.jobDetails.value == null) {
        return const Center(child: CircularProgressIndicator());
      }

      final jobDetails = controller.jobDetails.value!;

      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            JobHeaderWidget(jobDetails: jobDetails),
            SizedBox(height: 24.h),
            JobDescriptionWidget(description: jobDetails.description),
            SizedBox(height: 24.h),
            JobResponsibilitiesWidget(
              responsibilities: jobDetails.responsibilities,
            ),
            SizedBox(height: 24.h),
            JobQualificationsWidget(qualifications: jobDetails.qualifications),
            SizedBox(height: 40.h),
            JobActionButtonsWidget(applyJobStatus: applyJobStatus),
            SizedBox(height: 30.h),
          ],
        ),
      );
    });
  }
}
