import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/pop_up/common_pop_menu.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/extensions/extension.dart';
import '../../../../../utils/helpers/other_helper.dart';
import '../../../../../utils/enum/enum.dart';
import '../controller/job_posting_controller.dart';

class JobPostingScreen extends StatelessWidget {
  const JobPostingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: "Post New Job",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          GetBuilder<JobPostingController>(
            init: JobPostingController(),
            builder: (controller) => TextButton(
              onPressed: controller.saveDraft,
              child: const CommonText(
                text: "Save Draft",
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<JobPostingController>(
        init: JobPostingController(),
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(20.w),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Job Title
                  const CommonText(
                    text: "Job Title *",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    bottom: 8,
                  ),
                  CommonTextField(
                    controller: controller.titleController,
                    hintText: "e.g. Senior Flutter Developer",
                    validator: OtherHelper.validator,
                  ),

                  20.height,

                  /// Department & Location Row
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonText(
                              text: "Department *",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              bottom: 8,
                            ),
                            CommonTextField(
                              controller: controller.departmentController,
                              hintText: "e.g. Engineering",
                              validator: OtherHelper.validator,
                            ),
                          ],
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonText(
                              text: "Location *",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              bottom: 8,
                            ),
                            CommonTextField(
                              controller: controller.locationController,
                              hintText: "e.g. Dhaka, Bangladesh",
                              validator: OtherHelper.validator,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  20.height,

                  /// Job Type & Experience Level
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonText(
                              text: "Job Type",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              bottom: 8,
                            ),
                            PopUpMenu(
                              items: controller.jobTypes,
                              selectedItem: [controller.selectedJobType],
                              onTap: (index) => controller.setJobType(
                                controller.jobTypes[index],
                              ),
                              isContainer: true,
                            ),
                          ],
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonText(
                              text: "Experience Level",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              bottom: 8,
                            ),
                            PopUpMenu(
                              items: controller.experienceLevels,
                              selectedItem: [
                                controller.selectedExperienceLevel,
                              ],
                              onTap: (index) => controller.setExperienceLevel(
                                controller.experienceLevels[index],
                              ),
                              isContainer: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  20.height,

                  /// Salary Range
                  const CommonText(
                    text: "Salary Range (BDT)",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    bottom: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextField(
                          controller: controller.salaryMinController,
                          hintText: "Minimum",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      12.width,
                      const CommonText(text: "to"),
                      12.width,
                      Expanded(
                        child: CommonTextField(
                          controller: controller.salaryMaxController,
                          hintText: "Maximum",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),

                  20.height,

                  /// Education & Deadline
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonText(
                              text: "Education",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              bottom: 8,
                            ),
                            PopUpMenu(
                              items: controller.educationLevels,
                              selectedItem: [controller.selectedEducation],
                              onTap: (index) => controller.setEducation(
                                controller.educationLevels[index],
                              ),
                              isContainer: true,
                            ),
                          ],
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonText(
                              text: "Application Deadline",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              bottom: 8,
                            ),
                            CommonTextField(
                              controller: controller.deadlineController,
                              hintText: "Select date",
                              onSubmitted: (value) =>
                                  controller.selectDeadline(),
                              onTap: () => controller.selectDeadline(),
                              suffixIcon: const Icon(Icons.calendar_today),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  20.height,

                  /// Required Skills
                  const CommonText(
                    text: "Required Skills *",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    bottom: 8,
                  ),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: controller.availableSkills.map((skill) {
                      final isSelected = controller.selectedSkills.contains(
                        skill,
                      );
                      return InkWell(
                        onTap: () => controller.toggleSkill(skill),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primaryColor
                                : AppColors.filledColor,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.textFiledColor,
                            ),
                          ),
                          child: CommonText(
                            text: skill,
                            fontSize: 12,
                            color: isSelected
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  20.height,

                  /// Job Description
                  const CommonText(
                    text: "Job Description *",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    bottom: 8,
                  ),
                  CommonTextField(
                    controller: controller.descriptionController,
                    hintText: "Describe the role, responsibilities...",

                    validator: OtherHelper.validator,
                  ),

                  20.height,

                  /// Requirements
                  const CommonText(
                    text: "Requirements *",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    bottom: 8,
                  ),
                  CommonTextField(
                    controller: controller.requirementsController,
                    hintText: "List the required qualifications...",

                    validator: OtherHelper.validator,
                  ),

                  20.height,

                  /// Benefits
                  const CommonText(
                    text: "Benefits & Perks",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    bottom: 8,
                  ),
                  CommonTextField(
                    controller: controller.benefitsController,
                    hintText: "Health insurance, flexible hours...",
                  ),

                  20.height,

                  /// Job Status
                  const CommonText(
                    text: "Job Status",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    bottom: 8,
                  ),
                  Row(
                    children: JobStatus.values.map((status) {
                      return Expanded(
                        child: RadioListTile<JobStatus>(
                          title: CommonText(
                            text: status.name.toUpperCase(),
                            fontSize: 12,
                          ),
                          value: status,
                          groupValue: controller.selectedStatus,
                          onChanged: (value) => controller.setJobStatus(value!),
                          dense: true,
                        ),
                      );
                    }).toList(),
                  ),

                  40.height,

                  /// Submit Button
                  CommonButton(
                    titleText: "Post Job",
                    onTap: controller.postJob,
                    isLoading: controller.isLoading,
                    buttonColor: AppColors.primaryColor,
                    titleColor: AppColors.white,
                  ),

                  20.height,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
