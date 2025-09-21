import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  int selectedTabIndex = 0;
  final List<String> tabs = ['Confirmed', 'Pending', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppBar(title: AppString.appointments),
      body: Column(
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
                          color: selectedTabIndex == index
                              ? AppColors.blue500
                              : AppColors.textFiledColor,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: CommonText(
                          text: tab,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? AppColors.white
                              : AppColors.textFiledColor,
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
          Container(
            padding: EdgeInsets.all(16.w),
            child: CommonButton(
              titleText: 'Ask For Appointment',
              onTap: () {
                // Handle ask for appointment action
              },
              buttonColor: AppColors.blue500,
              titleColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildConfirmedAppointments() {
    return [
      _buildAppointmentCard(
        name: 'Md Kamran',
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

  Widget _buildAppointmentCard({
    required String name,
    required String date,
    required String time,
    required String status,
    required Color statusColor,
    required bool showActions,
    required bool isConfirmed,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.textFiledColor),
      ),
      child: Column(
        children: [
          // User Info Row
          Row(
            children: [
              // Profile Avatar
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.filledColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.textFiledColor,
                  size: 24.sp,
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
                    Row(
                      children: [
                        CommonText(
                          text: date,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textFiledColor,
                        ),
                        8.width,
                        Icon(
                          Icons.access_time,
                          size: 16.sp,
                          color: AppColors.textFiledColor,
                        ),
                        4.width,
                        CommonText(
                          text: time,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textFiledColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Eye and Message Icons
              Row(
                children: [
                  Icon(
                    Icons.visibility_outlined,
                    color: AppColors.textFiledColor,
                    size: 20.sp,
                  ),
                  12.width,
                  Icon(
                    Icons.chat_bubble_outline,
                    color: AppColors.textFiledColor,
                    size: 20.sp,
                  ),
                ],
              ),
            ],
          ),

          // Status
          12.height,
          Row(
            children: [
              CommonText(
                text: status,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: statusColor,
              ),
            ],
          ),

          // Action Buttons
          if (showActions) ...[
            16.height,
            Row(
              children: [
                if (!isConfirmed) ...[
                  Expanded(
                    child: CommonButton(
                      titleText: 'Confirm',
                      onTap: () {
                        // Handle confirm action
                      },
                      buttonColor: AppColors.blue500,
                      titleColor: AppColors.white,
                      buttonHeight: 40.h,
                    ),
                  ),
                  12.width,
                ],
                Expanded(
                  child: CommonButton(
                    titleText: 'Cancel',
                    onTap: () {
                      // Handle cancel action
                    },
                    buttonColor: AppColors.red,
                    titleColor: AppColors.white,
                    buttonHeight: 40.h,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
