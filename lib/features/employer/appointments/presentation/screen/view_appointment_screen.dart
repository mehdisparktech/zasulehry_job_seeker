import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';

class ViewAppointmentScreen extends StatefulWidget {
  const ViewAppointmentScreen({super.key});

  @override
  State<ViewAppointmentScreen> createState() => _ViewAppointmentScreenState();
}

class _ViewAppointmentScreenState extends State<ViewAppointmentScreen> {
  TextEditingController messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    messageController.text =
        'dear md kamran khan,\nlocation : dhaka bangladesh\n an appointment is available for you on 01.02.2025/17:25 uhr.kindly confirm it in your jobsinApp account. please come to this address \n an appointment is available for you on 01.02.2025/17:25 uhr.kindly confirm it in your jobsinApp account. please come to this address';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'View'),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonTextField(
                  controller: messageController,
                  hintText: 'View Appointment',
                  fillColor: AppColors.white,
                  borderColor: AppColors.blue500,
                  borderRadius: 8.r,
                  maxLines: 10,
                ),
                100.height,
                CommonButton(
                  titleText: 'Send Now',
                  onTap: () {
                    Get.snackbar(
                      'Success',
                      'Appointment sent successfully',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.blue500,
                      colorText: AppColors.white,
                      duration: const Duration(seconds: 1),
                    );
                  },
                  buttonRadius: 8.r,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
