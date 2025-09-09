import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../utils/constants/app_colors.dart';

class ApplicationItem extends StatelessWidget {
  final Map application;
  final Function(String) onStatusUpdate;
  final VoidCallback onScheduleInterview;
  final VoidCallback onViewProfile;
  final VoidCallback onDownloadResume;
  final VoidCallback onSendMessage;
  final VoidCallback onShortlist;
  final VoidCallback onReject;
  final VoidCallback onHire;

  const ApplicationItem({
    super.key,
    required this.application,
    required this.onStatusUpdate,
    required this.onScheduleInterview,
    required this.onViewProfile,
    required this.onDownloadResume,
    required this.onSendMessage,
    required this.onShortlist,
    required this.onReject,
    required this.onHire,
  });

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'new':
        return Colors.blue;
      case 'reviewed':
        return Colors.orange;
      case 'interview scheduled':
        return Colors.purple;
      case 'shortlisted':
        return Colors.green;
      case 'hired':
        return Colors.teal;
      case 'rejected':
        return Colors.red;
      default:
        return AppColors.textFiledColor;
    }
  }

  @override
  Widget build(BuildContext context) {
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
          /// Header Row
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                child: CommonText(
                  text: application['candidateName']?.substring(0, 1) ?? 'U',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              12.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: application['candidateName'] ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    4.height,
                    CommonText(
                      text: application['jobTitle'] ?? '',
                      fontSize: 14,
                      color: AppColors.textFiledColor,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: _getStatusColor(
                    application['status'] ?? '',
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: CommonText(
                  text: application['status'] ?? '',
                  fontSize: 10,
                  color: _getStatusColor(application['status'] ?? ''),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          16.height,

          /// Candidate Details
          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                  Icons.work_outline,
                  "${application['experience'] ?? ''} experience",
                ),
              ),
              Expanded(
                child: _buildDetailItem(
                  Icons.location_on_outlined,
                  application['location'] ?? '',
                ),
              ),
            ],
          ),

          8.height,

          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                  Icons.school_outlined,
                  application['education'] ?? '',
                ),
              ),
              Expanded(
                child: _buildDetailItem(
                  Icons.payments_outlined,
                  "৳${application['expectedSalary'] ?? ''}",
                ),
              ),
            ],
          ),

          12.height,

          /// Skills
          if (application['skills'] != null && application['skills'].isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonText(
                  text: "Skills:",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                4.height,
                Wrap(
                  spacing: 4.w,
                  runSpacing: 4.h,
                  children: (application['skills'] as List).take(4).map((
                    skill,
                  ) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: CommonText(
                        text: skill,
                        fontSize: 10,
                        color: AppColors.primaryColor,
                      ),
                    );
                  }).toList(),
                ),
                8.height,
              ],
            ),

          /// Applied Date
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 14.sp,
                color: AppColors.textFiledColor,
              ),
              4.width,
              CommonText(
                text: "Applied on ${application['appliedDate'] ?? ''}",
                fontSize: 12,
                color: AppColors.textFiledColor,
              ),
            ],
          ),

          16.height,

          /// Action Buttons
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  titleText: "View Profile",
                  onTap: onViewProfile,
                  buttonHeight: 32,
                  buttonColor: AppColors.primaryColor.withOpacity(0.1),
                  titleColor: AppColors.primaryColor,
                ),
              ),
              8.width,
              Expanded(
                child: CommonButton(
                  titleText: "Download CV",
                  onTap: onDownloadResume,
                  buttonHeight: 32,
                  buttonColor: AppColors.filledColor,
                  titleColor: AppColors.black,
                ),
              ),
              8.width,
              _buildActionMenu(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14.sp, color: AppColors.textFiledColor),
        4.width,
        Expanded(
          child: CommonText(
            text: text,
            fontSize: 12,
            color: AppColors.textFiledColor,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildActionMenu() {
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'shortlist':
            onShortlist();
            break;
          case 'interview':
            onScheduleInterview();
            break;
          case 'hire':
            onHire();
            break;
          case 'reject':
            onReject();
            break;
          case 'message':
            onSendMessage();
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'shortlist', child: Text('Shortlist')),
        const PopupMenuItem(
          value: 'interview',
          child: Text('Schedule Interview'),
        ),
        const PopupMenuItem(value: 'hire', child: Text('Hire')),
        const PopupMenuItem(value: 'reject', child: Text('Reject')),
        const PopupMenuItem(value: 'message', child: Text('Send Message')),
      ],
      child: Container(
        width: 32.w,
        height: 32.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.filledColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: const Icon(
          Icons.more_vert,
          size: 16,
          color: AppColors.textFiledColor,
        ),
      ),
    );
  }
}

extension SpaceExtension on num {
  Widget get verticalSpace => SizedBox(height: toDouble().h);
  Widget get horizontalSpace => SizedBox(width: toDouble().w);
}
