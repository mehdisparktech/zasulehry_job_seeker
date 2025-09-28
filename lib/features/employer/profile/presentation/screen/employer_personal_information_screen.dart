import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/services/storage/storage_services.dart';
import '../../../../../core/utils/extensions/extension.dart';

class EmployerPersonalInformationScreen extends StatefulWidget {
  const EmployerPersonalInformationScreen({super.key});

  @override
  State<EmployerPersonalInformationScreen> createState() =>
      _EmployerPersonalInformationScreenState();
}

class _EmployerPersonalInformationScreenState
    extends State<EmployerPersonalInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with stored data or example data
    nameController.text = LocalStorage.myName.isNotEmpty
        ? LocalStorage.myName
        : "Example Name";
    emailController.text = "Example@Gmail.Com";
    contactController.text = "+8801234567890";
    locationController.text = "Dhaka Bangladesh";
    roleController.text = "Job Seeker";
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    contactController.dispose();
    locationController.dispose();
    roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(-0.9, 0),
                        end: Alignment(1.0, 0),
                        colors: [
                          Color(0xFF083E4B),
                          Color(0xFF074E5E),
                          Color(0xFF0288A6),
                        ],
                        stops: [0.0, 0.4, 1.0],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36.r),
                        bottomRight: Radius.circular(36.r),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              const CommonText(
                                text: AppString.personalInformation,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(height: 64.h), // Space for avatar
                        ],
                      ),
                    ),
                  ),

                  // Name text with extra top padding to accommodate avatar
                  Align(
                    child: Padding(
                      padding: EdgeInsets.only(top: 64.h, bottom: 16.h),
                      child: CommonText(
                        text: (LocalStorage.myName.isNotEmpty
                            ? LocalStorage.myName
                            : "Google"),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blue500,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),

                  _buildPersonalInformationRow(),

                  40.height,

                  // Name Field

                  // Edit Profile Button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonButton(
                            titleText: "Edit Profile",
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.employerEditPersonalInformation,
                                arguments: {"appTitle": "Edit Profile"},
                              );
                              // Navigate to edit profile or handle edit functionality
                            },
                          ),
                        ),
                        16.width,
                        Expanded(
                          child: CommonButton(
                            titleText: "Complete Profile",
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.employerEditPersonalInformation,
                                arguments: {"appTitle": "Complete Profile"},
                              );
                              // Navigate to edit profile or handle edit functionality
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Positioned CircleAvatar to overlap header container
              Positioned(
                top: 160.h, // Adjust this value to position avatar correctly
                left: 0,
                right: 0,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: AppColors.transparent,
                    radius: 52.r,
                    child: const ClipOval(
                      child: CommonImage(
                        imageSrc: AppImages.google,
                        size: 120,
                        defaultImage: AppImages.google,
                        fill: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalInformationRow() {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.blue100, width: 1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildInfoRow("Name", nameController.text),
          16.height,
          _buildInfoRow("Email", emailController.text),
          16.height,
          _buildInfoRow("Contact", contactController.text),
          16.height,
          _buildInfoRow("Location", locationController.text),
          16.height,
          _buildInfoRow("Role", roleController.text),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w,
          child: CommonText(
            text: label,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            textAlign: TextAlign.start,
          ),
        ),
        CommonText(
          text: ': ',
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        Expanded(
          child: CommonText(
            text: value,
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
