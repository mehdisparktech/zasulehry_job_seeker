import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/component/text/common_text.dart';

class ConnectedAccountsScreen extends StatefulWidget {
  const ConnectedAccountsScreen({super.key});

  @override
  State<ConnectedAccountsScreen> createState() =>
      _ConnectedAccountsScreenState();
}

class _ConnectedAccountsScreenState extends State<ConnectedAccountsScreen> {
  Map<String, bool> accountConnections = {
    'Google': true,
    'Facebook': false,
    'Apple': false,
  };

  final Map<String, Map<String, dynamic>> accountDetails = {
    'Google': {
      'icon': AppImages.google,
      'color': Colors.red,
      'description': 'Connect with your Google account for easy sign-in',
    },
    'Facebook': {
      'icon': Icons.facebook,
      'color': Colors.blue.shade800,
      'description': 'Share job opportunities with your Facebook network',
    },

    'Apple': {
      'icon': Icons.apple,
      'color': Colors.black,
      'description': 'Sign in with your Apple ID for enhanced security',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: AppString.connectedAccounts),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: AppColors.textFiledColor, thickness: 1.h),
                itemCount: accountConnections.keys.length,
                itemBuilder: (context, index) {
                  final accountName = accountConnections.keys.elementAt(index);
                  final isConnected = accountConnections[accountName]!;
                  final details = accountDetails[accountName]!;

                  return Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 48.w,
                          height: 48.h,

                          child: index == 0
                              ? Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CommonImage(imageSrc: details['icon']),
                                )
                              : Icon(
                                  details['icon'],
                                  color: details['color'],
                                  size: 24.sp,
                                ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CommonText(
                                    text: accountName,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                  SizedBox(width: 8.w),
                                  if (isConnected)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade100,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: CommonText(
                                        text: 'Connected',
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green.shade700,
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                            ],
                          ),
                        ),
                        Switch(
                          value: isConnected,
                          onChanged: (value) {
                            setState(() {
                              accountConnections[accountName] = value;
                            });

                            // Show connection status
                            Get.snackbar(
                              value ? 'Connected' : 'Disconnected',
                              value
                                  ? '$accountName account connected successfully'
                                  : '$accountName account disconnected',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: value
                                  ? Colors.green
                                  : Colors.orange,
                              colorText: Colors.white,
                              duration: const Duration(seconds: 1),
                            );
                          },
                          activeColor: AppColors.blue500,
                          activeTrackColor: AppColors.activeTrackColor,
                          inactiveThumbColor: AppColors.textFiledColor,
                          inactiveTrackColor: AppColors.activeTrackColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
