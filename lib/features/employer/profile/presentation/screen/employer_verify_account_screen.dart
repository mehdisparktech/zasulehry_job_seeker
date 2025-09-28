import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_string.dart';

class EmployerVerifyAccountScreen extends StatefulWidget {
  const EmployerVerifyAccountScreen({super.key});

  @override
  State<EmployerVerifyAccountScreen> createState() =>
      _EmployerVerifyAccountScreenState();
}

class _EmployerVerifyAccountScreenState
    extends State<EmployerVerifyAccountScreen> {
  bool isTermsAccepted = false;
  String? selectedDocumentPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        title: AppString.verifyAccount,
        isBackButton: true,
        backgroundColor: AppColors.backgroundGradient,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              // Upload Business Documents Title
              CommonText(
                text: AppString.uploadBusinessDocuments,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),

              SizedBox(height: 20.h),

              // Upload Section
              GestureDetector(
                onTap: _pickDocument,
                child: Container(
                  width: double.infinity,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: AppColors.transparent,
                    border: Border.all(color: AppColors.blue500, width: 1.5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonImage(imageSrc: AppImages.upload),
                      SizedBox(height: 8.h),
                      // CommonText(
                      //   text: selectedDocumentPath != null
                      //       ? "Document Selected"
                      //       : "Tap to upload document",
                      //   fontSize: 14.sp,
                      //   color: AppColors.textFiledColor,
                      // ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),
              CommonImage(imageSrc: AppImages.card),

              // // First Business Card Example
              // _buildBusinessCardExample(
              //   website: "www.example.com",
              //   brandName: "BRAND NAME",
              //   slogan: "YOUR SLOGAN HERE",
              //   isFirstCard: true,
              // ),

              // SizedBox(height: 15.h),

              // // Second Business Card Example
              // _buildBusinessCardExample(
              //   name: "YOUR NAME",
              //   designation: "GRAPHIC DESIGN",
              //   phone1: "+000 123 456 789",
              //   phone2: "+000 123 456 785",
              //   email: "mail address here",
              //   website: "Address here",
              //   address: "Address Here 0123",
              //   isFirstCard: false,
              // ),
              SizedBox(height: 30.h),

              // Terms and Conditions Checkbox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTermsAccepted = !isTermsAccepted;
                      });
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        color: isTermsAccepted
                            ? AppColors.primaryColor
                            : AppColors.white,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: isTermsAccepted
                          ? Icon(
                              Icons.check,
                              size: 14.sp,
                              color: AppColors.white,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.black,
                          height: 1.4,
                        ),
                        children: [
                          TextSpan(
                            text: "${AppString.byContinuingYouAccepted} ",
                          ),
                          TextSpan(
                            text: AppString.privacyPolicy,
                            style: TextStyle(
                              color: AppColors.blue500,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: " ${AppString.privacyPolicyAnd} "),
                          TextSpan(
                            text: AppString.termsAndCondition,
                            style: TextStyle(
                              color: AppColors.blue500,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: "."),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              // Confirm Button
              CommonButton(
                titleText: AppString.confirm,
                onTap: isTermsAccepted ? _handleConfirm : null,
                isLoading: false,
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildBusinessCardExample({
    String? website,
    String? brandName,
    String? slogan,
    String? name,
    String? designation,
    String? phone1,
    String? phone2,
    String? email,
    String? address,
    required bool isFirstCard,
  }) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background decorative elements
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 60.w,
              height: 120.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.primaryColor.withOpacity(0.8),
                    AppColors.primaryColor.withOpacity(0.3),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
            ),
          ),

          // Card content
          Padding(
            padding: EdgeInsets.all(16.w),
            child: isFirstCard
                ? _buildFirstCardContent(
                    website: website,
                    brandName: brandName,
                    slogan: slogan,
                  )
                : _buildSecondCardContent(
                    name: name,
                    designation: designation,
                    phone1: phone1,
                    phone2: phone2,
                    email: email,
                    website: website,
                    address: address,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstCardContent({
    String? website,
    String? brandName,
    String? slogan,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: website ?? "",
                fontSize: 10.sp,
                color: AppColors.black,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 2),
                ),
                child: Center(
                  child: CommonText(
                    text: "O",
                    fontSize: 18.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              CommonText(
                text: brandName ?? "",
                fontSize: 12.sp,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              CommonText(
                text: slogan ?? "",
                fontSize: 8.sp,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecondCardContent({
    String? name,
    String? designation,
    String? phone1,
    String? phone2,
    String? email,
    String? website,
    String? address,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 2),
                ),
                child: Center(
                  child: CommonText(
                    text: "O",
                    fontSize: 18.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              CommonText(
                text: "BRAND NAME",
                fontSize: 12.sp,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              CommonText(
                text: "YOUR SLOGAN HERE",
                fontSize: 8.sp,
                color: AppColors.white,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: name ?? "",
                fontSize: 14.sp,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
              CommonText(
                text: designation ?? "",
                fontSize: 10.sp,
                color: AppColors.black,
              ),
              SizedBox(height: 8.h),
              _buildContactItem(Icons.phone, phone1 ?? ""),
              _buildContactItem(Icons.phone, phone2 ?? ""),
              _buildContactItem(Icons.email, email ?? ""),
              _buildContactItem(Icons.language, website ?? ""),
              _buildContactItem(Icons.home, address ?? ""),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        children: [
          Icon(icon, size: 10.sp, color: AppColors.primaryColor),
          SizedBox(width: 6.w),
          Expanded(
            child: CommonText(
              text: text,
              fontSize: 8.sp,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _pickDocument() {
    setState(() {
      selectedDocumentPath = "document_selected.pdf";
    });

    // Show a snackbar for now
    Get.snackbar(
      "Document Selection",
      "Document picker functionality needs to be implemented",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );
  }

  void _handleConfirm() {
    if (!isTermsAccepted) {
      Get.snackbar(
        "Terms Required",
        "Please accept the terms and conditions",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
      );
      return;
    }

    if (selectedDocumentPath == null) {
      Get.snackbar(
        "Document Required",
        "Please upload a business document",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
      );
      return;
    }

    Get.snackbar(
      "Success",
      "Account verification request submitted successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );

    // Navigate back or to next screen
    Get.back();
  }
}
