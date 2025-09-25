import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/glass_effect_icon.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/item.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/component/pop_up/whatsapp_support_popup.dart';
import 'package:zasulehry_job_seeker/core/component/pop_up/add_whatsapp_link_popup.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/employer/notifications/presentation/screen/employee_notification_setting_screen.dart';

class EmployerDeshboaredScreen extends StatelessWidget {
  const EmployerDeshboaredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // My Posted Jobs
              Item(
                image: AppImages.postJob,
                title: AppString.myPostedJobs,
                onTap: () => Get.toNamed(AppRoutes.employerPostedJobs),
              ),

              // Post Job
              Item(
                image: AppImages.add2,
                title: AppString.postJob,
                onTap: () => Get.toNamed(AppRoutes.employerPostJob),
              ),

              // AI Tools
              Item(
                image: AppImages.setting,
                title: AppString.aiTools,
                onTap: () => Get.toNamed(AppRoutes.employerAiTools),
              ),

              // Appointments
              Item(
                image: AppImages.appointments,
                title: AppString.appointments,
                onTap: () => Get.toNamed(AppRoutes.employerAppointments),
              ),

              // WhatsApp Support
              Item(
                image: AppImages.whatsapp,
                title: AppString.whatsappSupport,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => WhatsappSupportPopup(
                      onSubmit: () {
                        // Handle the WhatsApp link submission here
                        if (kDebugMode) {
                          print('WhatsApp link submitted');
                        }
                      },
                    ),
                  );
                },
              ),

              // Add WhatsApp Link
              Item(
                image: AppImages.whatsapp,
                title: AppString.addWhatsappLink,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddWhatsappLinkPopup(
                      currentLink:
                          'https://wa.me/1234567890?text=Hello%20I%20am%20interested%20in%20your%20job%20posting',
                      onEdit: () {
                        // Show edit dialog (can reuse WhatsappSupportPopup)
                        showDialog(
                          context: context,
                          builder: (context) => WhatsappSupportPopup(
                            onSubmit: () {
                              if (kDebugMode) {
                                print('WhatsApp link updated');
                              }
                            },
                          ),
                        );
                      },
                      onDelete: () {
                        // Handle WhatsApp link deletion
                        if (kDebugMode) {
                          print('WhatsApp link deleted');
                        }
                      },
                    ),
                  );
                },
              ),

              // Contact & Support
              Item(
                image: AppImages.contactSupport,
                title: AppString.contactAndSupport,
                onTap: () => Get.toNamed(AppRoutes.employerContactSupport),
              ),

              // Download Center
              Item(
                image: AppImages.download2,
                title: AppString.downloadCenter,
                onTap: () => Get.toNamed(AppRoutes.employerDownloadCenter),
              ),

              // Verify Account
              Item(
                image: AppImages.verify,
                title: AppString.verifyAccount,
                onTap: () => Get.toNamed(AppRoutes.employerVerifyAccount),
              ),

              // Salary Calculator
              Item(
                image: AppImages.calculator,
                title: AppString.salaryCalculator,
                onTap: () => Get.toNamed(AppRoutes.employerSalaryCalculator),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 0),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.9, 0),
            end: Alignment(1.0, 0),
            colors: [
              Color(0xFF083E4B), // #083E4B
              Color(0xFF074E5E), // #074E5E
              Color(0xFF0288A6), // #0288A6
            ],
            stops: [0.0, 0.4, 1.0],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "welcome to JobsinApp",
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
            // Changed to white for better contrast
          ),
          CommonText(
            text: 'Google',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
            // Changed to white for better contrast
          ),
        ],
      ),
      centerTitle: false,
      leading: Padding(
        padding: EdgeInsets.only(left: 14.w),
        child: CommonImage(
          imageSrc: AppImages.google,
          width: 32.w,
          height: 32.h,
        ),
      ),
      actions: [
        GlassEffectIcon(icon: AppImages.phone),
        8.width,
        GlassEffectIcon(icon: AppImages.notification,onTap: (){
          Get.to(EmployeeNotificationSettingScreen());
        },),
        8.width,
      ],
    );
  }
}
