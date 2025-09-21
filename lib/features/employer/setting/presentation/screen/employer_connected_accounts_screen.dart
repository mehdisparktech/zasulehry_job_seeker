import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
    'LinkedIn': true,
    'Twitter': false,
    'GitHub': false,
    'Apple': false,
  };

  final Map<String, Map<String, dynamic>> accountDetails = {
    'Google': {
      'icon': Icons.email,
      'color': Colors.red,
      'description': 'Connect with your Google account for easy sign-in',
    },
    'Facebook': {
      'icon': Icons.facebook,
      'color': Colors.blue.shade800,
      'description': 'Share job opportunities with your Facebook network',
    },
    'LinkedIn': {
      'icon': Icons.business,
      'color': Colors.blue.shade700,
      'description': 'Import your professional profile from LinkedIn',
    },
    'Twitter': {
      'icon': Icons.alternate_email,
      'color': Colors.blue.shade400,
      'description': 'Share job updates on your Twitter profile',
    },
    'GitHub': {
      'icon': Icons.code,
      'color': Colors.black87,
      'description': 'Showcase your coding projects and repositories',
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
      appBar: CommonAppBar(title: AppString.connectedAccounts),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: 'Manage your connected accounts',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            SizedBox(height: 8.h),
            CommonText(
              text:
                  'Connect your social media accounts to enhance your job search experience',
              fontSize: 14.sp,
              color: Colors.grey.shade600,
            ),
            SizedBox(height: 24.h),

            Expanded(
              child: ListView.builder(
                itemCount: accountConnections.keys.length,
                itemBuilder: (context, index) {
                  final accountName = accountConnections.keys.elementAt(index);
                  final isConnected = accountConnections[accountName]!;
                  final details = accountDetails[accountName]!;

                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        children: [
                          Container(
                            width: 48.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: details['color'].withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(
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
                                CommonText(
                                  text: details['description'],
                                  fontSize: 12.sp,
                                  color: Colors.grey.shade600,
                                ),
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
                                duration: const Duration(seconds: 2),
                              );
                            },
                            activeColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20.h),

            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.blue.shade700,
                    size: 20.sp,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CommonText(
                      text:
                          'Your data is secure. We only access basic profile information to enhance your job search experience.',
                      fontSize: 12.sp,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
