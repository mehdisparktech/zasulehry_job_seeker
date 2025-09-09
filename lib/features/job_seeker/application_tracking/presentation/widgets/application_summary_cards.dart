import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../controller/application_tracking_controller.dart';

class ApplicationSummaryCards extends StatelessWidget {
  final ApplicationTrackingController controller;

  const ApplicationSummaryCards({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  "Total",
                  controller.totalApplications.toString(),
                  Icons.work_outline,
                  Colors.blue,
                ),
              ),
              12.width,
              Expanded(
                child: _buildSummaryCard(
                  "Pending",
                  controller.pendingApplications.toString(),
                  Icons.pending_outlined,
                  Colors.orange,
                ),
              ),
            ],
          ),
          12.height,
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  "Interviews",
                  controller.interviewsScheduled.toString(),
                  Icons.event_outlined,
                  Colors.purple,
                ),
              ),
              12.width,
              Expanded(
                child: _buildSummaryCard(
                  "Success",
                  controller.successfulApplications.toString(),
                  Icons.check_circle_outline,
                  Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, color: color, size: 20.sp),
              ),
              const Spacer(),
            ],
          ),
          12.height,
          CommonText(
            text: value,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          4.height,
          CommonText(
            text: title,
            fontSize: 12,
            color: AppColors.textFiledColor,
          ),
        ],
      ),
    );
  }
}
