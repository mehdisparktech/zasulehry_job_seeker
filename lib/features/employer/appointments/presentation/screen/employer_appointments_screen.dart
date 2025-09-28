import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/widgets/appointment_details_dialog.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/widgets/appointment_request_dialog.dart';

class EmployerAppointmentsScreen extends StatefulWidget {
  const EmployerAppointmentsScreen({super.key});

  @override
  State<EmployerAppointmentsScreen> createState() =>
      _EmployerAppointmentsScreenState();
}

class _EmployerAppointmentsScreenState
    extends State<EmployerAppointmentsScreen> {
  int selectedTabIndex = 0;
  final List<String> tabs = ['Confirmed', 'Pending', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppString.appointments),
      body: SafeArea(
        child: Column(
          children: [
            // Filter Tabs
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: tabs.asMap().entries.map((entry) {
                  int index = entry.key;
                  String tab = entry.value;
                  bool isSelected = selectedTabIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.blue500
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppColors.blue500,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: CommonText(
                            text: tab,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.white
                                : AppColors.blue500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Appointments List
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    // Show appointments based on selected tab
                    if (selectedTabIndex == 0) ..._buildConfirmedAppointments(),
                    if (selectedTabIndex == 1) ..._buildPendingAppointments(),
                    if (selectedTabIndex == 2) ..._buildCancelledAppointments(),
                  ],
                ),
              ),
            ),

            // Bottom Action Button
            if (selectedTabIndex == 0 || selectedTabIndex == 1) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CommonButton(
                  titleText: 'Cancel',
                  onTap: () {
                    // Handle ask for appointment action
                    showConfirmationDialog(
                      message:
                          'Are You Sure You Want To Cancel The Appointment',
                      onConfirm: () {
                        Get.back();
                        // Handle cancel appointment action
                        AppointmentRequestDialog.show(
                          isConfirm: true,
                          isReply: false,
                        );
                      },
                      onCancel: () {
                        // Handle cancel appointment action
                        Get.back();
                      },
                    );
                  },
                  titleColor: AppColors.white,
                  buttonColor: AppColors.red2,
                  borderColor: AppColors.red2,
                  buttonRadius: 4.r,
                  isGradient: false,
                ),
              ),
              16.height,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                margin: EdgeInsets.only(bottom: 16.h),
                child: CommonButton(
                  titleText: 'Create New Appointment',
                  onTap: () {
                    Get.toNamed(AppRoutes.employerCreateAppointment);
                  },
                  buttonColor: AppColors.blue500,
                  titleColor: AppColors.white,
                  buttonRadius: 4.r,
                  titleWeight: FontWeight.w500,
                ),
              ),
              40.height,
            ],
          ],
        ),
      ),
    );
  }

  List<Widget> _buildConfirmedAppointments() {
    return [
      _buildAppointmentCard(
        name: 'Md Kamran      (+880123456789)',
        date: '10.02.2025',
        time: '17:26',
        status: 'Confirmed',
        statusColor: AppColors.blue500,
        showActions: true,
        isConfirmed: true,
      ),
    ];
  }

  List<Widget> _buildPendingAppointments() {
    return [
      _buildAppointmentCard(
        name: 'Md Kamran',
        date: '10.02.2025',
        time: '17:26',
        status: 'Pending',
        statusColor: AppColors.red,
        showActions: true,
        isConfirmed: false,
      ),
      16.height,
      _buildAppointmentCard(
        name: 'Md Kamran',
        date: '10.02.2025',
        time: '17:26',
        status: 'Cancelled by You',
        statusColor: AppColors.red,
        showActions: false,
        isConfirmed: false,
      ),
      16.height,
      _buildAppointmentCard(
        name: 'Md Kamran',
        date: '10.02.2025',
        time: '17:26',
        status: 'Cancelled by Kamran',
        statusColor: AppColors.red,
        showActions: false,
        isConfirmed: false,
      ),
    ];
  }

  List<Widget> _buildCancelledAppointments() {
    return [
      _buildAppointmentCard(
        name: 'Md Kamran',
        date: '10.02.2025',
        time: '17:26',
        status: 'Cancelled by You',
        statusColor: AppColors.red,
        showActions: false,
        isConfirmed: false,
        isCancelled: true,
      ),
      16.height,
      _buildAppointmentCard(
        name: 'Md Kamran',
        date: '10.02.2025',
        time: '17:26',
        status: 'Cancelled by Kamran',
        statusColor: AppColors.red,
        showActions: false,
        isConfirmed: false,
        isCancelled: true,
      ),
    ];
  }

  void showConfirmationDialog({
    required String message,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.white,
        content: CommonText(text: message, fontSize: 18.sp, maxLines: 2),
        actions: [
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  onTap: onCancel,
                  titleText: 'No',
                  titleColor: AppColors.white,
                  buttonColor: AppColors.red2,
                  borderColor: AppColors.red2,
                  isGradient: false,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CommonButton(
                  onTap: onConfirm,
                  titleText: 'Yes',
                  titleColor: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard({
    required String name,
    required String date,
    required String time,
    required String status,
    required Color statusColor,
    required bool showActions,
    required bool isConfirmed,
    bool isCancelled = false,
  }) {
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
              // Name and Date/Time
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

          Row(
            children: [
              CommonImage(
                imageSrc: AppImages.calender,
                width: 16.w,
                height: 16.h,
              ),
              4.width,
              CommonText(
                text: date,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
              8.width,
              CommonImage(
                imageSrc: AppImages.clock,
                width: 24.w,
                height: 24.h,
                imageColor: AppColors.blue500,
              ),
              4.width,
              CommonText(
                text: time,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
              12.width,
              Spacer(),
              GestureDetector(
                onTap: () {
                  AppointmentDetailsDialog.show(
                    name: name,
                    date: date,
                    time: time,
                    status: status,
                  );
                },
                child: CommonImage(
                  imageSrc: AppImages.view,
                  width: 24.w,
                  height: 24.h,
                  imageColor: AppColors.blue500,
                ),
              ),

              12.width,
              // Checkbox(value: true, onChanged: (value) {}),
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: AppColors.transparent,
                  border: Border.all(color: AppColors.blue500, width: 2),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Icon(Icons.check, size: 16.sp, color: AppColors.blue500),
              ),
            ],
          ),
          if (isCancelled) ...[
            Row(
              children: [
                Icon(Icons.info_outline, size: 16.sp, color: AppColors.blue500),
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
}
