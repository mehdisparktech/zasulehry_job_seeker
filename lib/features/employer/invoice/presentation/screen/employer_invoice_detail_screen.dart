import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';

class EmployerInvoiceDetailScreen extends StatefulWidget {
  const EmployerInvoiceDetailScreen({super.key});

  @override
  State<EmployerInvoiceDetailScreen> createState() =>
      _EmployerInvoiceDetailScreenState();
}

class _EmployerInvoiceDetailScreenState
    extends State<EmployerInvoiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(title: 'View Invoice', shapeRadius: 24),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Information
              _buildCompanyInfo(),
              SizedBox(height: 24.h),

              // Invoice Header
              _buildInvoiceHeader(),
              SizedBox(height: 16.h),

              // Invoice Details Table
              _buildInvoiceTable(),
              SizedBox(height: 24.h),

              // Items Table
              _buildItemsTable(),
              SizedBox(height: 24.h),

              // Pricing Summary
              _buildPricingSummary(),
              SizedBox(height: 80.h),
              Divider(color: AppColors.blue500),
              // Contact Details
              _buildContactDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Percenter Germany,2541,House,20',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        SizedBox(height: 8.h),
        CommonText(
          text: 'Zisan',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        SizedBox(height: 4.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Street,House No,',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  4.height,
                  CommonText(
                    text: '1234 Dhaka',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  4.height,
                  CommonText(
                    text: 'Bangladesh',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  4.height,
                  CommonText(
                    text: 'Customer ID  24513',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Tax No 1234',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  CommonText(
                    text: 'DE No 1234',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInvoiceHeader() {
    return CommonText(
      text: 'Invoice',
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.blue500,
    );
  }

  Widget _buildInvoiceTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
      },
      children: [
        // Header Row
        TableRow(
          decoration: BoxDecoration(color: Colors.grey.shade100),
          children: [
            _buildTableCell('Invoice No.', isHeader: true),
            _buildTableCell('Invoice Date', isHeader: true),
            _buildTableCell('Delivery Date', isHeader: true),
            _buildTableCell('Order No:', isHeader: true),
          ],
        ),
        // Data Row
        TableRow(
          children: [
            _buildTableCell('025463212'),
            _buildTableCell('01.02.2025'),
            _buildTableCell('08.02.2025'),
            _buildTableCell('150369'),
          ],
        ),
      ],
    );
  }

  Widget _buildItemsTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(0.5),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
      },
      children: [
        // Header Row
        TableRow(
          decoration: BoxDecoration(color: Colors.white),
          children: [
            _buildTableCell('Pos.', isHeader: true, isBorder: true),
            _buildTableCell('Details', isHeader: true, isBorder: true),
            _buildTableCell('Quantity', isHeader: true, isBorder: true),
            _buildTableCell('Price', isHeader: true, isBorder: true),
          ],
        ),

        // Data Row
        TableRow(
          children: [
            _buildTableCell('1'),
            _buildTableCell('Standard Subscription'),
            _buildTableCell('12'),
            _buildTableCell('250'),
          ],
        ),
      ],
    );
  }

  Widget _buildPricingSummary() {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.40),
      child: Column(
        children: [
          // Netto Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: 'Netto Price',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              CommonText(
                text: '250',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          ),
          Divider(color: AppColors.blue500),

          // Sales Tax
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: 'Sales Tax 19%',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              CommonText(
                text: '60',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          ),

          Divider(color: AppColors.blue500),
          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: 'Total',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              CommonText(
                text: '300€',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ],
          ),
          Divider(color: AppColors.blue500),
        ],
      ),
    );
  }

  Widget _buildContactDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Contact Details',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8.h),
                  CommonText(
                    text: 'Telephone Number',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(height: 4.h),
                  CommonText(
                    text: 'Email Address',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Account Number',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8.h),
                  CommonText(
                    text: 'DE 1234 5678 9123 4567 89',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  SizedBox(height: 4.h),
                  CommonText(
                    text: 'Bic 12345656',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTableCell(
    String text, {
    bool isHeader = false,
    bool isBorder = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      decoration: isBorder
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.blue500, width: 1),
              ),
            )
          : null,
      child: CommonText(
        text: text,
        fontSize: isHeader ? 12.sp : 14.sp,
        fontWeight: isHeader ? FontWeight.w600 : FontWeight.w400,
        color: isHeader ? Colors.grey.shade600 : Colors.black,
      ),
    );
  }
}
