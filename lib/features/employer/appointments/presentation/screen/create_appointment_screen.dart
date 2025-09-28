import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/employer/appointments/presentation/controller/create_appointment_controller.dart';

class CreateAppointmentScreen extends StatefulWidget {
  const CreateAppointmentScreen({super.key});

  @override
  State<CreateAppointmentScreen> createState() =>
      _CreateAppointmentScreenState();
}

class _CreateAppointmentScreenState extends State<CreateAppointmentScreen> {
  final CreateAppointmentController controller = Get.put(
    CreateAppointmentController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(
        title: 'Create Appointment',
        isShowBackButton: true,
      ),
      body: SafeArea(
        child: GetBuilder<CreateAppointmentController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Job Seeker Dropdown
                  _buildJobSeekerDropdown(),

                  20.height,

                  // Date and Time Selection Row
                  Row(
                    children: [
                      Expanded(child: _buildDateSelector()),
                      16.width,
                      Expanded(child: _buildTimeSelector()),
                    ],
                  ),

                  20.height,

                  // Appointment Options
                  _buildAppointmentOptions(),

                  20.height,

                  // Message Input
                  _buildMessageInput(),

                  30.height,

                  // Confirm Button
                  _buildConfirmButton(),

                  20.height,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildJobSeekerDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.background),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: controller.selectedJobSeeker,
          hint: CommonText(
            text: 'Search Job Seeker',
            fontSize: 14,
            color: AppColors.textFiledColor,
          ),
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textFiledColor,
            size: 20.sp,
          ),
          items: controller.jobSeekers.map((String jobSeeker) {
            return DropdownMenuItem<String>(
              value: jobSeeker,
              child: CommonText(
                text: jobSeeker,
                fontSize: 14,
                color: AppColors.black,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            controller.setSelectedJobSeeker(newValue);
          },
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return GestureDetector(
      onTap: () => controller.selectDate(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: AppColors.background),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            8.width,
            CommonText(
              text: controller.selectedDate.isEmpty
                  ? 'Date'
                  : controller.selectedDate,
              fontSize: 18.sp,
              color: controller.selectedDate.isEmpty
                  ? AppColors.textSecondary
                  : AppColors.black,
            ),
            8.width,
            CommonImage(imageSrc: AppImages.calender),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelector() {
    return GestureDetector(
      onTap: () => controller.selectTime(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: AppColors.background),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            8.width,
            CommonText(
              text: controller.selectedTime.isEmpty
                  ? 'Time'
                  : controller.selectedTime,
              fontSize: 18.sp,
              color: controller.selectedTime.isEmpty
                  ? AppColors.textSecondary
                  : AppColors.black,
            ),
            8.width,
            CommonImage(
              imageSrc: AppImages.clock,
              imageColor: AppColors.blue500,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentOptions() {
    return Column(
      children: [
        _buildAppointmentOption(
          'An appointment is available for you on 01.02.2025/17:25 uhr. Kindly confirm it in your JobsinApp Account and share one active contact number. We will call you',
          0,
        ),
        12.height,
        _buildAppointmentOption(
          'An appointment is available for you on 01.02.2025/17:25 uhr. Kindly confirm it in your JobsinApp Account. Please come to this address',
          1,
        ),
      ],
    );
  }

  Widget _buildAppointmentOption(String text, int index) {
    return Row(
      children: [
        Radio<int>(
          value: index,
          groupValue: controller.selectedAppointmentOption,
          onChanged: (int? value) {
            controller.setSelectedAppointmentOption(value);
          },
          activeColor: AppColors.blue500,
          fillColor: WidgetStateProperty.all(AppColors.blue500),
        ),
        8.width,
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.blue500),
            ),
            child: Column(
              children: [
                CommonText(
                  text: text,
                  fontSize: 16.sp,
                  color: AppColors.black,
                  maxLines: 4,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w400,
                ),
                16.height,
                if (index == 1)
                  CommonTextField(
                    hintText: 'type here meeting address',
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.blue500,
                    maxLines: 1,
                    borderRadius: 30.r,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Type Here Message',
            fontSize: 18.sp,
            color: AppColors.black,
            bottom: 20.h,
            fontWeight: FontWeight.w400,
          ),
          CommonTextField(
            controller: controller.messageController,
            hintText:
                'Lorem Ipsum Dolor Sit Amet Consectetur. Bibendum ipsum Donec Fames Et Gravida Non Est. Vel Et In Ut Egestas Elementum Ut Tristique At Imperdiet Elit In Ut At Tristique Aliquam. Tincidunt Urna Congue Ut Rhoncibus Mattis A Eu Sodales Leo Sed Tristique At Imperdiet',
            fillColor: AppColors.white,
            borderColor: AppColors.blue500,
            borderRadius: 8.r,
            maxLines: 5,
            textInputAction: TextInputAction.newline,
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return CommonButton(
      titleText: 'Confirm Appointment',
      onTap: () => controller.confirmAppointment(),
      buttonColor: AppColors.blue500,
      titleColor: AppColors.white,
      buttonRadius: 8.r,
      buttonHeight: 50.h,
    );
  }
}
