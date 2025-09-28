import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/widgets/appointment_details_dialog.dart';

class AppointmentCardWidget extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final String status;
  final Color statusColor;
  final bool showActions;
  final bool isConfirmed;
  final bool isCancelled;

  const AppointmentCardWidget({
    super.key,
    required this.name,
    required this.date,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.showActions,
    required this.isConfirmed,
    this.isCancelled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          // User Info Row
          Row(
            children: [
              // Profile Avatar
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.blue500,
                child: ClipOval(
                  child: CommonImage(
                    imageSrc: AppImages.profile,
                    size: 40,
                    fill: BoxFit.cover,
                  ),
                ),
              ),
              12.width,
              // Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: name,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    4.height,
                  ],
                ),
              ),
            ],
          ),

          // Date, Time, and Actions Row
          Row(
            children: [
              Icon(Icons.calendar_month, size: 16.sp, color: AppColors.blue500),
              4.width,
              CommonText(
                text: date,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
              8.width,
              Icon(Icons.access_time, size: 16.sp, color: AppColors.blue500),
              4.width,
              CommonText(
                text: time,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
              12.width,
              Spacer(),
              // View Details Button
              GestureDetector(
                onTap: () => _showAppointmentDetails(),
                child: CommonImage(imageSrc: AppImages.view, size: 28),
              ),
              12.width,
              // Check Button
              Container(
                width: 24.r,
                height: 24.r,
                decoration: BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.blue500, width: 2),
                ),
                child: Center(
                  child: Icon(Icons.check, size: 16, color: AppColors.blue500),
                ),
              ),
            ],
          ),

          // Status for cancelled appointments
          if (isCancelled) ...[
            8.height,
            Row(
              children: [
                Icon(Icons.info, size: 16.sp, color: AppColors.blue500),
                4.width,
                CommonText(
                  text: status,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _showAppointmentDetails() {
    AppointmentDetailsDialog.show(
      name: name,
      date: date,
      time: time,
      status: status,
    );
  }
}
