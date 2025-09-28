import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/features/employer/notifications/presentation/screen/employee_email_screen.dart';
import 'package:zasulehry_job_seeker/features/employer/notifications/presentation/screen/job_seeker_notification.dart';

import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../core/constants/app_colors.dart';
import '../controller/create_jobseekder_controller.dart';

class CreateJobseekerAlertScreen extends StatelessWidget {
  const CreateJobseekerAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateJobseekerAlertController controller = Get.put(
      CreateJobseekerAlertController(),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: 'Settings'),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Job Title Field
                CommonText(
                  text: "Job Title",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 8.h),
                CommonTextField(
                  controller: controller.jobTitleController,
                  hintText: 'Type Here...',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter job title';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20.h),

                // City/Post Code Field
                CommonText(
                  text: "City/Post Code",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 8.h),
                CommonTextField(
                  controller: controller.cityPostCodeController,
                  hintText: 'Type Here...',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter city or post code';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 24.h),

                // Push Message Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: "Push Message",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: Colors.black,
                    ),
                    Obx(
                      () => Switch(
                        value: controller.isPushMessageEnabled.value,
                        onChanged: controller.togglePushMessage,
                        activeColor: AppColors.primaryColor,
                        trackColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Frequency Selection (only show if push message is enabled)
                Obx(
                  () => controller.isPushMessageEnabled.value
                      ? Column(
                          children: [
                            Row(
                              children: controller.frequencies.map((frequency) {
                                return Obx(
                                  () => Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => controller.selectFrequency(
                                          frequency,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16.w,
                                            vertical: 8.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                controller
                                                        .selectedFrequency
                                                        .value ==
                                                    frequency
                                                ? AppColors.primaryColor
                                                : Colors.transparent,
                                            border: Border.all(
                                              color:
                                                  controller
                                                          .selectedFrequency
                                                          .value ==
                                                      frequency
                                                  ? AppColors.primaryColor
                                                  : Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF083E4B), // #083E4B
                                                Color(0xFF074E5E), // #074E5E
                                                Color(0xFF0288A6), // #0288A6
                                              ],
                                            ),
                                          ),
                                          child: Text(
                                            frequency,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  controller
                                                          .selectedFrequency
                                                          .value ==
                                                      frequency
                                                  ? AppColors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (frequency !=
                                          controller.frequencies.last)
                                        SizedBox(width: 12.w),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),

                            SizedBox(height: 16.h),
                          ],
                        )
                      : const SizedBox(),
                ),

                // Email Address Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: "Email Address",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                      color: AppColors.black,
                    ),
                    Obx(
                      () => Switch(
                        value: controller.isEmailEnabled.value,
                        onChanged: controller.toggleEmail,
                        activeColor: AppColors.primaryColor,
                        trackColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                Align(
                  alignment: Alignment.topRight,
                  child: IntrinsicWidth(
                    child: CommonButton(
                      titleText: 'Email Settings',
                      buttonColor: AppColors.backgroundGradient,
                      onTap: () => Get.to(() => EmployeeEmailScreen()),
                      buttonWidth: 150,
                      titleWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                // Privacy Policy Checkbox
                Obx(
                  () => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Checkbox(
                          value: controller.isPrivacyPolicyAccepted.value,
                          onChanged: (value) =>
                              controller.togglePrivacyPolicy(value ?? false),
                          activeColor: AppColors.primaryColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.black,
                            ),
                            children: [
                              const TextSpan(
                                text: 'By Continuing, You Accept The ',
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const TextSpan(text: ' And '),
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const TextSpan(text: ' of JobsInApp.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 150.h),
                // Submit Button
                CommonButton(
                  titleText: 'Submit',
                  onTap: () {
                    Get.to(JobSeekersScreen());
                  },
                ),

                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
