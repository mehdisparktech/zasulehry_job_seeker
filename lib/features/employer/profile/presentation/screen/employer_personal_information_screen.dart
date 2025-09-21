import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/services/storage/storage_services.dart';
import '../../../../../core/utils/extensions/extension.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
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
      appBar: const CommonAppBar(title: AppString.personalInformation),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            // Profile Image Section
            Center(
              child: CircleAvatar(
                radius: 60.r,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: CommonImage(
                    imageSrc: AppImages.profile,
                    size: 120,
                    defaultImage: AppImages.profile,
                    fill: BoxFit.cover,
                  ),
                ),
              ),
            ),

            24.height,

            // Form Fields Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                _buildFormField(
                  label: "Name",
                  controller: nameController,
                  hintText: "Enter your name",
                  prefixIcon: Icons.person,
                ),

                16.height,

                // Email Field
                _buildFormField(
                  label: "Email",
                  controller: emailController,
                  hintText: "Enter your email",
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),

                16.height,

                // Contact Field
                _buildFormField(
                  label: "Contact",
                  controller: contactController,
                  hintText: "Enter your contact number",
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),

                16.height,

                // Location Field
                _buildFormField(
                  label: "Location",
                  controller: locationController,
                  hintText: "Enter your location",
                  prefixIcon: Icons.location_on,
                ),

                16.height,

                // Role Field
                _buildFormField(
                  label: "Role",
                  controller: roleController,
                  hintText: "Enter your role",
                  prefixIcon: Icons.work,
                ),

                40.height,

                // Edit Profile Button
                CommonButton(
                  titleText: "Edit Profile",
                  onTap: () {
                    // Navigate to edit profile or handle edit functionality
                    Get.snackbar(
                      "Info",
                      "Edit Profile functionality will be implemented",
                      backgroundColor: AppColors.primaryColor,
                      colorText: AppColors.white,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          textAlign: TextAlign.left,
          bottom: 8,
        ),
        CommonTextField(
          controller: controller,
          hintText: hintText,
          prefixIcon: Icon(prefixIcon, color: AppColors.textFiledColor),
          keyboardType: keyboardType,
          fillColor: AppColors.filledColor,
          borderColor: AppColors.background,
          textColor: AppColors.black,
        ),
      ],
    );
  }
}
