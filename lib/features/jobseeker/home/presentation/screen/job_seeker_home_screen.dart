import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/controller/job_seeker_home_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/widgets/search_and_map_widget.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/widgets/job_openings_widget.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/widgets/custom_app_bar_widget.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/widgets/filter_bottom_sheet_widget.dart';

class JobSeekerHomeScreen extends StatelessWidget {
  const JobSeekerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    Get.put(JobSeekerHomeController());

    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SearchAndMapWidget(onFilterTap: _showFilterBottomSheet),
                    const JobOpeningsWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 0),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (context) => const FilterBottomSheetWidget(),
    );
  }
}
