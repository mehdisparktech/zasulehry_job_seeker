import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/card/job_card.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/home/presentation/screen/view_job_details_screen.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';

class JobSeekerHomeScreen extends StatefulWidget {
  const JobSeekerHomeScreen({super.key});

  @override
  State<JobSeekerHomeScreen> createState() => _JobSeekerHomeScreenState();
}

class _JobSeekerHomeScreenState extends State<JobSeekerHomeScreen> {
  GoogleMapController? _mapController;

  // Default location (Dhaka, Bangladesh - Central area)
  static const CameraPosition _dhakaLocation = CameraPosition(
    target: LatLng(23.8103, 90.4125), // Dhaka center coordinates
    zoom: 12.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Welcome To Percenter',
        subtitle: 'Example Name',
        isCenterTitle: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 24.r,
            child: CommonImage(
              imageSrc: AppImages.noImage,
              width: 30.w,
              height: 30.h,
            ),
          ),
        ),
        isBackButton: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: AppColors.white),
            color: AppColors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [_buildSearchAndMap(), _buildJobOpeningsSection()],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildSearchAndMap() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          // Google Maps Container
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: AppColors.background, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _dhakaLocation,

                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                  // Force camera to Dhaka location
                  _moveToLocation();
                },
                zoomControlsEnabled: true,
                mapToolbarEnabled: false,
                myLocationButtonEnabled: true,
                myLocationEnabled: false, // Disable to show Dhaka by default
                compassEnabled: false,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                tiltGesturesEnabled: false,
              ),
            ),
          ),
          16.height,
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  hintText: 'Search Location',
                  borderRadius: 25,
                  paddingHorizontal: 16,
                  paddingVertical: 10,
                  fillColor: AppColors.transparent,
                  borderColor: AppColors.blue500,
                  textColor: AppColors.blue500,
                  hintTextColor: AppColors.blue500,
                ),
              ),
              12.width,
              // Search short button
              InkWell(
                onTap: _showFilterBottomSheet,
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJobOpeningsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Job Opening (20)',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.blue500,
            textAlign: TextAlign.start,
          ),
          16.height,
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => JobCard(
              companyName: 'Google',
              location: 'California Usa',
              jobTitle: 'Senior Business Analys',
              salaryRange: '\$200-\$300/Month',
              timePosted: '2 Days Ago',
              isFullTime: true,
              companyLogo: 'G',
              onTap: () => Get.to(() => ViewJobDetailsScreen()),
            ),
            separatorBuilder: (context, index) => 16.height,
          ),
          20.height,
        ],
      ),
    );
  }

  // Build and show the Filter Bottom Sheet
  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (context) {
        // Local states for the bottom sheet only
        String? category;
        String? subCategory;
        String? employmentType = 'Full Time';
        String? experience = 'With Experience';
        int salaryTypeIndex = 1; // 0=Hourly,1=Monthly,2=Yearly
        double salary = 50; // Example
        double distance = 10;

        final List<String> categories = ['Category', 'IT', 'Marketing', 'Design'];
        final List<String> subCategories = ['Sub Category', 'Frontend', 'Backend', 'UI/UX'];
        final List<String> employmentTypes = ['Full Time', 'Part Time', 'Contract'];
        final List<String> experiences = ['With Experience', 'Fresher'];

        return StatefulBuilder(
          builder: (context, setState) {
            Widget dropdown({
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
                      color: AppColors.blue500,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    icon: Icon(Icons.keyboard_arrow_down, color: AppColors.blue500),
                    items: items
                        .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: CommonText(
                                text: e,
                                color: AppColors.blue500,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ))
                        .toList(),
                    onChanged: onChanged,
                  ),
                ),
              );
            }

            Widget segmentButton(String text, int index) {
              final bool selected = salaryTypeIndex == index;
              return GestureDetector(
                onTap: () => setState(() => salaryTypeIndex = index),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.background : Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: AppColors.background),
                  ),
                  child: CommonText(
                    text: text,
                    color: AppColors.blue500,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
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
                      ),
                      8.height,

                      // Category
                      dropdown(
                        hint: 'Category',
                        value: category,
                        items: categories,
                        onChanged: (v) => setState(() => category = v),
                      ),
                      12.height,
                      // Sub Category
                      dropdown(
                        hint: 'Sub Category',
                        value: subCategory,
                        items: subCategories,
                        onChanged: (v) => setState(() => subCategory = v),
                      ),
                      12.height,
                      // Employment Type
                      dropdown(
                        hint: 'Full Time',
                        value: employmentType,
                        items: employmentTypes,
                        onChanged: (v) => setState(() => employmentType = v),
                      ),
                      12.height,
                      // Experience
                      dropdown(
                        hint: 'With Experience',
                        value: experience,
                        items: experiences,
                        onChanged: (v) => setState(() => experience = v),
                      ),
                      16.height,
                      // Salary header and segments
                      Row(
                        children: [
                          CommonText(
                            text: 'Salary',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue500,
                          ),
                          12.width,
                          segmentButton('Hourly', 0),
                          6.width,
                          segmentButton('Monthly', 1),
                          6.width,
                          segmentButton('Yearly', 2),
                        ],
                      ),
                      8.height,
                      // Salary slider with min and max labels
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Slider(
                            value: salary,
                            min: 10,
                            max: 100,
                            divisions: 90,
                            activeColor: AppColors.primaryColor,
                            inactiveColor: AppColors.background,
                            onChanged: (v) => setState(() => salary = v),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(text: '\$10', fontSize: 12, color: AppColors.blue500),
                              CommonText(text: '\$100', fontSize: 12, color: AppColors.blue500),
                            ],
                          ),
                        ],
                      ),
                      16.height,
                      CommonText(
                        text: 'Distance',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue500,
                      ),
                      8.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Slider(
                            value: distance,
                            min: 10,
                            max: 100,
                            divisions: 90,
                            activeColor: AppColors.primaryColor,
                            inactiveColor: AppColors.background,
                            onChanged: (v) => setState(() => distance = v),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(text: '10km', fontSize: 12, color: AppColors.blue500),
                              CommonText(text: '100km', fontSize: 12, color: AppColors.blue500),
                            ],
                          ),
                        ],
                      ),
                      20.height,
                      CommonButton(
                        titleText: AppString.confirm,
                        buttonHeight: 48.h,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Method to move camera to Dhaka location
  void _moveToLocation() async {
    if (_mapController != null) {
      await _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(23.8103, 90.4125), // Dhaka coordinates
            zoom: 12.0,
          ),
        ),
      );
    }
  }
}
