import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';

class EmployerCreateInvoiceScreen extends StatefulWidget {
  const EmployerCreateInvoiceScreen({super.key});

  @override
  State<EmployerCreateInvoiceScreen> createState() =>
      _EmployerCreateInvoiceScreenState();
}

class _EmployerCreateInvoiceScreenState
    extends State<EmployerCreateInvoiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _clientNameController = TextEditingController();
  final _clientEmailController = TextEditingController();
  final _invoiceNumberController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _dueDateController = TextEditingController();

  @override
  void dispose() {
    _clientNameController.dispose();
    _clientEmailController.dispose();
    _invoiceNumberController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: 'Create Invoice'),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Client Information Section
              _buildSectionTitle('Client Information'),
              SizedBox(height: 16.h),

              CommonTextField(
                controller: _clientNameController,
                labelText: 'Client Name',
                hintText: 'Enter client name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter client name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              CommonTextField(
                controller: _clientEmailController,
                labelText: 'Client Email',
                hintText: 'Enter client email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter client email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              SizedBox(height: 24.h),

              // Invoice Details Section
              _buildSectionTitle('Invoice Details'),
              SizedBox(height: 16.h),

              CommonTextField(
                controller: _invoiceNumberController,
                labelText: 'Invoice Number',
                hintText: 'Enter invoice number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter invoice number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              CommonTextField(
                controller: _descriptionController,
                labelText: 'Description',
                hintText: 'Enter service description',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              CommonTextField(
                controller: _amountController,
                labelText: 'Amount',
                hintText: 'Enter amount',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              GestureDetector(
                onTap: () => _selectDueDate(context),
                child: AbsorbPointer(
                  child: CommonTextField(
                    controller: _dueDateController,
                    labelText: 'Due Date',
                    hintText: 'Select due date',
                    suffixIcon: const Icon(Icons.calendar_today),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select due date';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      titleText: 'Save as Draft',
                      buttonColor: AppColors.transparent,
                      titleColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      onTap: () {
                        _saveDraft();
                      },
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CommonButton(
                      titleText: 'Create Invoice',
                      onTap: () {
                        _createInvoice();
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return CommonText(
      text: title,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _dueDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _saveDraft() {
    // Save invoice as draft logic
    Get.snackbar(
      'Success',
      'Invoice saved as draft',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.white,
    );
  }

  void _createInvoice() {
    if (_formKey.currentState!.validate()) {
      // Create invoice logic
      Get.snackbar(
        'Success',
        'Invoice created successfully',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.white,
      );
      Get.back();
    }
  }
}
