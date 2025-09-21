import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';

class EmployerInvoiceDetailScreen extends StatefulWidget {
  const EmployerInvoiceDetailScreen({super.key});

  @override
  State<EmployerInvoiceDetailScreen> createState() =>
      _EmployerInvoiceDetailScreenState();
}

class _EmployerInvoiceDetailScreenState
    extends State<EmployerInvoiceDetailScreen> {
  // Mock invoice data - in real app this would come from parameters or API
  final Map<String, dynamic> invoiceData = {
    'invoiceNumber': 'INV-001',
    'clientName': 'John Doe',
    'clientEmail': 'john.doe@example.com',
    'description': 'Web Development Services',
    'amount': 2500.00,
    'dueDate': '15/02/2024',
    'status': 'Pending',
    'createdDate': '01/02/2024',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'Invoice ${invoiceData['invoiceNumber']}',
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => _showMoreOptions(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Badge
            _buildStatusBadge(),
            SizedBox(height: 24.h),

            // Invoice Information Card
            _buildInformationCard(),
            SizedBox(height: 24.h),

            // Client Information Card
            _buildClientCard(),
            SizedBox(height: 24.h),

            // Amount Card
            _buildAmountCard(),
            SizedBox(height: 32.h),

            // Action Buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color statusColor;
    switch (invoiceData['status']) {
      case 'Paid':
        statusColor = Colors.green;
        break;
      case 'Overdue':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.orange;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: statusColor),
      ),
      child: CommonText(
        text: invoiceData['status'],
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: statusColor,
      ),
    );
  }

  Widget _buildInformationCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Invoice Information',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 16.h),
          _buildInfoRow('Invoice Number', invoiceData['invoiceNumber']),
          _buildInfoRow('Created Date', invoiceData['createdDate']),
          _buildInfoRow('Due Date', invoiceData['dueDate']),
          _buildInfoRow('Description', invoiceData['description']),
        ],
      ),
    );
  }

  Widget _buildClientCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Client Information',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 16.h),
          _buildInfoRow('Client Name', invoiceData['clientName']),
          _buildInfoRow('Email', invoiceData['clientEmail']),
        ],
      ),
    );
  }

  Widget _buildAmountCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.9, 0),
          end: Alignment(1.0, 0),
          colors: [Color(0xFF083E4B), Color(0xFF074E5E), Color(0xFF0288A6)],
          stops: [0.0, 0.4, 1.0],
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: 'Amount',
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
          SizedBox(height: 8.h),
          CommonText(
            text: '\$${invoiceData['amount'].toStringAsFixed(2)}',
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: CommonText(
              text: label,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textFiledColor,
            ),
          ),
          Expanded(
            flex: 3,
            child: CommonText(
              text: value,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        if (invoiceData['status'] == 'Pending') ...[
          CommonButton(titleText: 'Mark as Paid', onTap: () => _markAsPaid()),
          SizedBox(height: 12.h),
        ],
        Row(
          children: [
            Expanded(
              child: CommonButton(
                titleText: 'Edit Invoice',
                buttonColor: AppColors.transparent,
                titleColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
                onTap: () => _editInvoice(),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CommonButton(
                titleText: 'Send Invoice',
                onTap: () => _sendInvoice(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.download),
              title: const CommonText(text: 'Download PDF'),
              onTap: () {
                Get.back();
                _downloadPDF();
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const CommonText(text: 'Share Invoice'),
              onTap: () {
                Get.back();
                _shareInvoice();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const CommonText(
                text: 'Delete Invoice',
                color: Colors.red,
              ),
              onTap: () {
                Get.back();
                _deleteInvoice();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _markAsPaid() {
    Get.snackbar(
      'Success',
      'Invoice marked as paid',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );
  }

  void _editInvoice() {
    // Navigate to edit invoice screen
    Get.snackbar(
      'Info',
      'Edit invoice functionality',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );
  }

  void _sendInvoice() {
    Get.snackbar(
      'Success',
      'Invoice sent to client',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );
  }

  void _downloadPDF() {
    Get.snackbar(
      'Success',
      'Invoice PDF downloaded',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );
  }

  void _shareInvoice() {
    Get.snackbar(
      'Info',
      'Share invoice functionality',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );
  }

  void _deleteInvoice() {
    Get.dialog(
      AlertDialog(
        title: const CommonText(text: 'Delete Invoice'),
        content: const CommonText(
          text: 'Are you sure you want to delete this invoice?',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const CommonText(text: 'Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
              Get.snackbar(
                'Success',
                'Invoice deleted successfully',
                backgroundColor: Colors.red,
                colorText: AppColors.white,
              );
            },
            child: const CommonText(text: 'Delete', color: Colors.red),
          ),
        ],
      ),
    );
  }
}
