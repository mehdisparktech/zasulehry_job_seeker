import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/cvcreation_pages/presentaion/screen/cv_create_step1_screen.dart';
import '../../../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/component/button/common_button.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/text/common_text.dart';
import '../controller/profile_controller.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/app_string.dart';
import '../widgets/edit_profile_all_filed.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          /// App Bar Sections Starts here
          appBar: AppBar(
            centerTitle: true,
            title: const CommonText(
              text: AppString.createProfile,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),

          /// Body Sections Starts here
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  /// User Profile image here
                  Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 85.sp,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: controller.image != null
                                ? Image.file(
                                    File(controller.image!),
                                    width: 170,
                                    height: 170,
                                    fit: BoxFit.fill,
                                  )
                                : const CommonImage(
                                    imageSrc: AppImages.profile,
                                    height: 170,
                                    width: 170,
                                    fill: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),

                      /// image change icon here
                      Positioned(
                        bottom: 0,
                        left: Get.width * 0.53,
                        child: IconButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateColor.resolveWith(
                              (states) => AppColors.blue500,
                            ),
                          ),
                          onPressed: controller.getProfileImage,
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  30.height,

                  /// user all information filed here
                  EditProfileAllFiled(controller: controller),
                  30.height,

                  CommonButton(
                    titleText: "inApp cv/resume creation",
                    onTap: () {
                      Get.to(() => CvCreateStep1Screen());
                    },
                    buttonRadius: 8.r,
                    buttonHeight: 38.h,
                    titleSize: 14.sp,
                    titleWeight: FontWeight.w500,
                  ),
                  30.height,

                  /// Submit Button here
                  CommonButton(
                    titleText: AppString.continues,
                    isLoading: controller.isLoading,
                    onTap: controller.editProfileRepo,
                    titleSize: 24.sp,
                    titleWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
