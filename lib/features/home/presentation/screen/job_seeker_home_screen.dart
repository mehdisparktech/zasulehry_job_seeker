import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zasulehry_job_seeker/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/component/card/job_card.dart';
import 'package:zasulehry_job_seeker/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/features/home/presentation/screen/view_job_details_screen.dart';
import 'package:zasulehry_job_seeker/utils/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/utils/constants/app_images.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';

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
              Container(
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
