import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/employer/invoice/presentation/screen/employer_invoice_detail_screen.dart';

class EmployerInvoiceListScreen extends StatefulWidget {
  const EmployerInvoiceListScreen({super.key});

  @override
  State<EmployerInvoiceListScreen> createState() =>
      _EmployerInvoiceListScreenState();
}

class _EmployerInvoiceListScreenState extends State<EmployerInvoiceListScreen> {
  final List<Map<String, dynamic>> invoices = [
    {'number': '25635556', 'date': '05.01.2022'},
    {'number': '25635556', 'date': '05.01.2022'},
    {'number': '25635556', 'date': '05.01.2022'},
    {'number': '25635556', 'date': '05.01.2022'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6E6),
      appBar: const CommonAppBar(title: 'Invoices', shapeRadius: 24),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: ListView.separated(
          itemCount: invoices.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final invoice = invoices[index];
            return _buildInvoiceCard(invoice);
          },
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 2),
    );
  }

  Widget _buildInvoiceCard(Map<String, dynamic> invoice) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: invoice['number'],
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                SizedBox(height: 4.h),
                CommonText(
                  text: invoice['date'],
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // View invoice action
                  Get.to(() => EmployerInvoiceDetailScreen());
                },
                icon: Icon(
                  Icons.visibility_outlined,
                  color: AppColors.blue500,
                  size: 20.sp,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              SizedBox(width: 12.w),
              IconButton(
                onPressed: () {
                  // Download invoice action
                },
                icon: Icon(
                  Icons.download_outlined,
                  color: AppColors.blue500,
                  size: 20.sp,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
