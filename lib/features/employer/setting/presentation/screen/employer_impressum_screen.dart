import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/constants/app_string.dart';
import '../../../../../core/component/text/common_text.dart';

class ImpressumScreen extends StatelessWidget {
  const ImpressumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.impressum),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Information Section
              _buildSection(
                title: 'Company Information',
                icon: Icons.business,
                children: [
                  _buildInfoRow('Company Name:', 'Zasulehry Job Seeker Ltd.'),
                  _buildInfoRow('Registration Number:', 'JSL-2024-001'),
                  _buildInfoRow('VAT Number:', 'BD-VAT-123456789'),
                  _buildInfoRow('Founded:', '2024'),
                ],
              ),

              SizedBox(height: 24.h),

              // Contact Information Section
              _buildSection(
                title: 'Contact Information',
                icon: Icons.contact_phone,
                children: [
                  _buildInfoRow(
                    'Address:',
                    'Dhaka, Bangladesh\nGulshan-2, Road 123\nHouse 456',
                  ),
                  _buildInfoRow('Phone:', '+880 1234-567890'),
                  _buildInfoRow('Email:', 'info@zasulehry.com'),
                  _buildInfoRow('Website:', 'www.zasulehry.com'),
                ],
              ),

              SizedBox(height: 24.h),

              // Legal Information Section
              _buildSection(
                title: 'Legal Information',
                icon: Icons.gavel,
                children: [
                  _buildInfoRow('Managing Director:', 'John Doe'),
                  _buildInfoRow(
                    'Commercial Register:',
                    'Dhaka Commercial Court',
                  ),
                  _buildInfoRow(
                    'Supervisory Authority:',
                    'Bangladesh Labor Ministry',
                  ),
                  _buildInfoRow(
                    'Professional Liability Insurance:',
                    'ABC Insurance Ltd.',
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Technical Information Section
              _buildSection(
                title: 'Technical Information',
                icon: Icons.computer,
                children: [
                  _buildInfoRow('Responsible for Content:', 'Tech Team'),
                  _buildInfoRow(
                    'Web Development:',
                    'Zasulehry Development Team',
                  ),
                  _buildInfoRow('Hosting Provider:', 'Cloud Services BD'),
                  _buildInfoRow(
                    'Data Protection Officer:',
                    'privacy@zasulehry.com',
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Disclaimer Section
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.warning_amber_outlined,
                          color: Colors.orange.shade700,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        CommonText(
                          text: 'Disclaimer',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange.shade700,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    CommonText(
                      text:
                          'The information provided in this app is for general informational purposes only. While we strive to keep the information up to date and correct, we make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability of the information contained in the app.',
                      fontSize: 12.sp,
                      color: Colors.grey.shade700,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Copyright Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.copyright,
                      color: Colors.blue.shade700,
                      size: 24.sp,
                    ),
                    SizedBox(height: 8.h),
                    CommonText(
                      text: '© 2024 Zasulehry Job Seeker Ltd.',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade700,
                    ),
                    SizedBox(height: 4.h),
                    CommonText(
                      text: 'All rights reserved.',
                      fontSize: 12.sp,
                      color: Colors.blue.shade600,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue.shade700, size: 20.sp),
                SizedBox(width: 8.w),
                CommonText(
                  text: title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade700,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
            child: CommonText(
              text: label,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          Expanded(
            child: CommonText(
              text: value,
              fontSize: 12.sp,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
