import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/controller/job_seeker_home_controller.dart';

class SearchAndMapWidget extends StatelessWidget {
  final VoidCallback? onFilterTap;

  const SearchAndMapWidget({super.key, this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JobSeekerHomeController>();

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          // Google Maps Container
          _buildMapContainer(),
          16.height,
          _buildSearchRow(controller),
        ],
      ),
    );
  }

  Widget _buildMapContainer() {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.background, width: 1),
      ),
      child: CommonImage(
        imageSrc: AppImages.map,
        width: double.infinity,
        height: 200.h,
      ),
    );
  }

  Widget _buildSearchRow(JobSeekerHomeController controller) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => CommonTextField(
              hintText: 'Search Location',
              borderRadius: 25,
              paddingHorizontal: 16,
              paddingVertical: 10,
              fillColor: AppColors.transparent,
              borderColor: AppColors.blue500,
              textColor: AppColors.blue500,
              hintTextColor: AppColors.blue500,
              controller: TextEditingController(
                text: controller.selectedLocation.value,
              ),
              onSubmitted: (value) => controller.updateLocation(value),
            ),
          ),
        ),
        12.width,
        _buildFilterButton(),
      ],
    );
  }

  Widget _buildFilterButton() {
    return InkWell(
      onTap: onFilterTap,
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.backgroundGradient,
              AppColors.backgroundGradient2,
              AppColors.backgroundGradient3,
            ],
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Icon(Icons.tune, color: AppColors.white, size: 20.sp),
      ),
    );
  }
}
