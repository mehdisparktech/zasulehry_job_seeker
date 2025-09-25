import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/controller/appointments_controller.dart';

class AppointmentDetailsDialog extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final String status;

  const AppointmentDetailsDialog({
    super.key,
    required this.name,
    required this.date,
    required this.time,
    required this.status,
  });

  static void show({
    required String name,
    required String date,
    required String time,
    required String status,
  }) {
    Get.dialog(
      AppointmentDetailsDialog(
        name: name,
        date: date,
        time: time,
        status: status,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppointmentsController>();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Content
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  children: [
                    // Profile Section
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: AppColors.blue500,
                          child: ClipOval(
                            child: CommonImage(
                              imageSrc: AppImages.profile,
                              size: 60,
                              fill: BoxFit.cover,
                            ),
                          ),
                        ),
                        16.width,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: '$name (Employer)',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                              4.height,
                              CommonText(
                                text: "$date/$time",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    24.height,

                    // Message Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text:
                              'Lorem Ipsum Dolor Sit Amet Consectetur. Tempor Et Eget Ipsum Donec Fames Et Gravida Non Est. Vel Et In Ut Egestas Fermentum Ut Tincidunt. Viverra Sem Nisl Elit In Ut At Tristique Aliquam. Tincidunt Urna Congue Et Penatibus Mattis A Eu Sodales. Leo Sed Tristique At Imperdiet',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          maxLines: 10,
                          textAlign: TextAlign.start,
                        ),
                        8.height,
                        Divider(color: AppColors.blue500, height: 8.h),
                        8.height,
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundColor: AppColors.blue500,
                              child: ClipOval(
                                child: CommonImage(
                                  imageSrc: AppImages.profile,
                                  size: 60,
                                  fill: BoxFit.cover,
                                ),
                              ),
                            ),
                            16.width,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: '$name (Employer)',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                  4.height,
                                  CommonText(
                                    text: "$date/$time",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        8.height,
                        CommonText(
                          text:
                              'Lorem Ipsum Dolor Sit Amet Consectetur. Tempor Et Eget Ipsum Donec Fames Et Gravida Non Est. Vel Et In Ut Egestas Fermentum Ut Tincidunt. Viverra Sem Nisl Elit In Ut At Tristique Aliquam. Tincidunt Urna Congue Et Penatibus Mattis A Eu Sodales. Leo Sed Tristique At Imperdiet',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          maxLines: 10,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),

                    24.height,

                    // Reply Button
                    CommonButton(
                      titleText: 'Reply',
                      onTap: controller.replyToAppointment,
                      buttonColor: AppColors.blue500,
                      titleColor: AppColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
