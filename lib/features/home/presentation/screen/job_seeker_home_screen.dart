import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zasulehry_job_seeker/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/component/card/job_card.dart';
import 'package:zasulehry_job_seeker/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/utils/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/utils/constants/app_images.dart';
import 'package:zasulehry_job_seeker/utils/extensions/extension.dart';

class JobSeekerHomeScreen extends StatefulWidget {
  const JobSeekerHomeScreen({super.key});

  @override
  State<JobSeekerHomeScreen> createState() => _JobSeekerHomeScreenState();
}

class _JobSeekerHomeScreenState extends State<JobSeekerHomeScreen> {
  Set<Marker> _markers = {};

  // Default location (Dhaka, Bangladesh)
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.8103, 90.4125),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
  }

  void _initializeMarkers() {
    _markers = {
      Marker(
        markerId: MarkerId('job1'),
        position: LatLng(23.8103, 90.4125),
        infoWindow: InfoWindow(
          title: 'Google Office',
          snippet: 'Senior Business Analyst position available',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      Marker(
        markerId: MarkerId('job2'),
        position: LatLng(23.8203, 90.4225),
        infoWindow: InfoWindow(
          title: 'Microsoft',
          snippet: 'Software Engineer role',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      Marker(
        markerId: MarkerId('job3'),
        position: LatLng(23.8003, 90.4025),
        infoWindow: InfoWindow(
          title: 'Amazon',
          snippet: 'Product Manager position',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      Marker(
        markerId: MarkerId('job4'),
        position: LatLng(23.8303, 90.4325),
        infoWindow: InfoWindow(
          title: 'Facebook',
          snippet: 'Data Scientist role',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      Marker(
        markerId: MarkerId('current_location'),
        position: LatLng(23.8103, 90.4125),
        infoWindow: InfoWindow(title: 'Your Location', snippet: 'You are here'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
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

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.backgroundGradient,
            AppColors.backgroundGradient2,
            AppColors.backgroundGradient3,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 24.r,
            child: CommonImage(
              imageSrc: AppImages.noImage,
              width: 30.w,
              height: 30.h,
            ),
          ),
          12.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'Welcome To Percenter',
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
                CommonText(
                  text: 'Example Name',
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications,
              color: AppColors.white,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndMap() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  hintText: 'Search Location',
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.textFiledColor,
                    size: 20.sp,
                  ),
                  borderRadius: 25,
                  paddingHorizontal: 20,
                  paddingVertical: 16,
                  fillColor: AppColors.filledColor,
                  borderColor: AppColors.transparent,
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
          20.height,
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
                initialCameraPosition: _kGooglePlex,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {},
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                compassEnabled: false,
              ),
            ),
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
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
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
            ),
            separatorBuilder: (context, index) => 16.height,
          ),
          20.height,
        ],
      ),
    );
  }
}
