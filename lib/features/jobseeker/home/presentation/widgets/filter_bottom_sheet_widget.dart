import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/controller/job_seeker_home_controller.dart';

class FilterBottomSheetWidget extends StatelessWidget {
  const FilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JobSeekerHomeController>();

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            8.height,
            _buildDropdowns(controller),
            16.height,
            _buildSalarySection(controller),
            16.height,
            _buildDistanceSection(controller),
            20.height,
            _buildActionButtons(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.redAccent),
            ),
            child: Icon(Icons.close, color: Colors.redAccent, size: 18.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdowns(JobSeekerHomeController controller) {
    return Column(
      children: [
        _buildDropdown(
          hint: 'Category',
          value: controller.category.value,
          items: controller.categories,
          onChanged: controller.updateCategory,
        ),
        12.height,
        _buildDropdown(
          hint: 'Sub Category',
          value: controller.subCategory.value,
          items: controller.subCategories,
          onChanged: controller.updateSubCategory,
        ),
        12.height,
        _buildDropdown(
          hint: 'Full Time',
          value: controller.employmentType.value,
          items: controller.employmentTypes,
          onChanged: (value) =>
              controller.updateEmploymentType(value ?? 'Full Time'),
        ),
        12.height,
        _buildDropdown(
          hint: 'With Experience',
          value: controller.experience.value,
          items: controller.experiences,
          onChanged: (value) =>
              controller.updateExperience(value ?? 'With Experience'),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String hint,
    String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.background),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          hint: CommonText(
            text: hint,
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.black),
          items: items
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: CommonText(
                    text: e,
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildSalarySection(JobSeekerHomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CommonText(
              text: 'Salary',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            12.width,
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buildSegmentButton('Hourly', 0, controller)),
                  6.width,
                  Expanded(
                    child: _buildSegmentButton('Monthly', 1, controller),
                  ),
                  6.width,
                  Expanded(child: _buildSegmentButton('Yearly', 2, controller)),
                ],
              ),
            ),
          ],
        ),
        8.height,
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Slider(
                value: controller.salary.value,
                min: 10,
                max: 100,
                divisions: 90,
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.background,
                onChanged: controller.updateSalary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: '\$10',
                    fontSize: 12,
                    color: AppColors.blue500,
                  ),
                  CommonText(
                    text: '\$100',
                    fontSize: 12,
                    color: AppColors.blue500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSegmentButton(
    String text,
    int index,
    JobSeekerHomeController controller,
  ) {
    return Obx(() {
      final bool selected = controller.salaryTypeIndex.value == index;
      return GestureDetector(
        onTap: () => controller.updateSalaryType(index),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: selected ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: CommonText(
            text: text,
            color: selected ? Colors.white : AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    });
  }

  Widget _buildDistanceSection(JobSeekerHomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Distance',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        8.height,
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Slider(
                value: controller.distance.value,
                min: 10,
                max: 100,
                divisions: 90,
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.background,
                onChanged: controller.updateDistance,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: '10km',
                    fontSize: 12,
                    color: AppColors.blue500,
                  ),
                  CommonText(
                    text: '100km',
                    fontSize: 12,
                    color: AppColors.blue500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(JobSeekerHomeController controller) {
    return Row(
      children: [
        Expanded(
          child: CommonButton(
            titleText: AppString.confirm,
            buttonHeight: 48.h,
            onTap: () {
              controller.applyFilters();
              Get.back();
            },
          ),
        ),
      ],
    );
  }
}
