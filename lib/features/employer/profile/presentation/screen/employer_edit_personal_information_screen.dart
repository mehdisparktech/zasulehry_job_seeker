import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/services/storage/storage_services.dart';
import '../../../../../core/utils/extensions/extension.dart';

class EditEmployerPersonalInformationScreen extends StatefulWidget {
  final String appTitle;
  const EditEmployerPersonalInformationScreen({
    super.key,
    required this.appTitle,
  });

  @override
  State<EditEmployerPersonalInformationScreen> createState() =>
      _EmployerPersonalInformationScreenState();
}

class _EmployerPersonalInformationScreenState
    extends State<EditEmployerPersonalInformationScreen> {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController legalFormController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController companyTypeController = TextEditingController();
  final TextEditingController taxNumberController = TextEditingController();
  final TextEditingController denumberController = TextEditingController();
  final TextEditingController typeOfBusinessController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    companyNameController.dispose();
    legalFormController.dispose();
    contactController.dispose();
    addressController.dispose();
    companyTypeController.dispose();
    taxNumberController.dispose();
    denumberController.dispose();
    typeOfBusinessController.dispose();
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
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.17,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                ),
                                CommonText(
                                  text: widget.appTitle,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(height: 50.h), // Space for avatar
                          ],
                        ),
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
                  // Name Field
                  _buildFormField(
                    hintText: "company name",
                    keyboardType: TextInputType.text,
                  ),

                  16.height,

                  // Email Field
                  _buildFormField(
                    hintText: "legal form",
                    keyboardType: TextInputType.text,
                  ),

                  16.height,

                  // Contact Field
                  _buildFormField(
                    hintText: "Address",
                    keyboardType: TextInputType.text,
                  ),

                  16.height,

                  // Location Field
                  _buildFormField(
                    hintText: "contact number",
                    keyboardType: TextInputType.phone,
                  ),

                  16.height,

                  // Role Field
                  _buildFormField(
                    hintText: "company Category",
                    keyboardType: TextInputType.text,
                  ),
                  16.height,
                  _buildFormField(
                    hintText: "tax No.",
                    keyboardType: TextInputType.phone,
                  ),

                  16.height,

                  // Location Field
                  _buildFormField(
                    hintText: "DE No.",
                    keyboardType: TextInputType.text,
                  ),

                  16.height,

                  // Role Field
                  _buildFormField(
                    hintText: "type of business",
                    keyboardType: TextInputType.text,
                  ),

                  // Edit Profile Button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20.0,
                    ),
                    child: CommonButton(
                      titleText: "Confirm",
                      onTap: () {
                        // Navigate to edit profile or handle edit functionality
                        Get.snackbar(
                          "Success",
                          "Personal information updated successfully",
                          backgroundColor: AppColors.primaryColor,
                          colorText: AppColors.white,
                          duration: const Duration(seconds: 1),
                        );
                      },
                    ),
                  ),
                ],
              ),
              // Positioned CircleAvatar to overlap header container
              Positioned(
                top: 140.h, // Adjust this value to position avatar correctly
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

  Widget _buildFormField({
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CommonTextField(
        //controller: controller,
        hintText: hintText,
        keyboardType: keyboardType,
        fillColor: AppColors.white,
        borderColor: AppColors.background,
        textColor: AppColors.black,
        hintTextColor: AppColors.textSecondary,
      ),
    );
  }
}
