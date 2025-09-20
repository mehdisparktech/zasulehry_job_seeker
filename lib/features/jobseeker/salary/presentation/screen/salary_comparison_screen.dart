import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/salary/presentation/controller/salary_comparison_controller.dart';

class SalaryComparisonScreen extends StatelessWidget {
  const SalaryComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SalaryComparisonController());
    
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppBar(title: AppString.salaryComparison),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            // Company Logo
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: CommonText(
                  text: 'P',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            24.height,
            
            // Job 1 Section
            _buildJobSection(
              'Job Title',
              controller.job1TitleController,
              'Enter job title',
            ),
            16.height,
            
            _buildJobSection(
              'Company',
              controller.job1CompanyController,
              'Enter company name',
            ),
            16.height,
            
            _buildJobSection(
              'Location',
              controller.job1LocationController,
              'Enter location',
            ),
            16.height,
            
            _buildJobSection(
              'Salary',
              controller.job1SalaryController,
              'Enter salary',
              isNumber: true,
            ),
            16.height,
            
            _buildJobSection(
              'Bonus',
              controller.job1BonusController,
              'Enter bonus',
              isNumber: true,
            ),
            32.height,
            
            // Compare Button
            CommonButton(
              titleText: 'Compare',
              onTap: () {
                controller.calculateComparison();
                _showComparisonResult(context, controller);
              },
              buttonHeight: 50.h,
            ),
            
            24.height,
            
            // Job 2 Section
            CommonText(
              text: 'Job 2 Details',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            16.height,
            
            _buildJobSection(
              'Job Title',
              controller.job2TitleController,
              'Enter job title',
            ),
            16.height,
            
            _buildJobSection(
              'Company',
              controller.job2CompanyController,
              'Enter company name',
            ),
            16.height,
            
            _buildJobSection(
              'Location',
              controller.job2LocationController,
              'Enter location',
            ),
            16.height,
            
            _buildJobSection(
              'Salary',
              controller.job2SalaryController,
              'Enter salary',
              isNumber: true,
            ),
            16.height,
            
            _buildJobSection(
              'Bonus',
              controller.job2BonusController,
              'Enter bonus',
              isNumber: true,
            ),
            32.height,
            
            // Save Comparison Button
            CommonButton(
              titleText: 'Save Comparison',
              onTap: () {
                Get.snackbar(
                  'Saved',
                  'Comparison saved successfully',
                  backgroundColor: AppColors.primaryColor,
                  colorText: AppColors.white,
                );
              },
              buttonColor: AppColors.white,
              titleColor: AppColors.primaryColor,
              borderColor: AppColors.primaryColor,
              buttonHeight: 50.h,
            ),
            
            20.height,
          ],
        ),
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 1),
    );
  }
  
  Widget _buildJobSection(String label, TextEditingController controller, String hint, {bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        8.height,
        CommonTextField(
          controller: controller,
          hintText: hint,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          fillColor: AppColors.filledColor,
          borderColor: AppColors.background,
        ),
      ],
    );
  }
  
  void _showComparisonResult(BuildContext context, SalaryComparisonController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              20.height,
              
              CommonText(
                text: 'Comparison Result',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              24.height,
              
              // Job 1 vs Job 2 Cards
              Row(
                children: [
                  Expanded(
                    child: _buildComparisonCard(
                      'Job 1',
                      controller.job1TotalAnnual.value,
                      controller.betterOption.value == 'Job 1',
                    ),
                  ),
                  16.width,
                  Expanded(
                    child: _buildComparisonCard(
                      'Job 2',
                      controller.job2TotalAnnual.value,
                      controller.betterOption.value == 'Job 2',
                    ),
                  ),
                ],
              ),
              
              24.height,
              
              // Winner Section
              if (controller.betterOption.value != 'Equal') ...[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF083E4B),
                        Color(0xFF074E5E),
                        Color(0xFF0288A6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.emoji_events,
                        color: Colors.amber,
                        size: 32.sp,
                      ),
                      8.height,
                      CommonText(
                        text: '${controller.betterOption.value} Wins!',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                      8.height,
                      CommonText(
                        text: '৳ ${controller.salaryDifference.value.toStringAsFixed(0)} higher',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                      CommonText(
                        text: '${controller.percentageDifference.value.toStringAsFixed(1)}% more',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
              ],
              
              const Spacer(),
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      titleText: 'Share Result',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      buttonColor: AppColors.white,
                      titleColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                    ),
                  ),
                  16.width,
                  Expanded(
                    child: CommonButton(
                      titleText: 'Save Comparison',
                      onTap: () {
                        Navigator.pop(context);
                        Get.snackbar(
                          'Saved',
                          'Comparison saved successfully',
                          backgroundColor: AppColors.primaryColor,
                          colorText: AppColors.white,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
  
  Widget _buildComparisonCard(String jobTitle, double amount, bool isWinner) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isWinner ? AppColors.primaryColor : AppColors.filledColor,
        borderRadius: BorderRadius.circular(12.r),
        border: isWinner ? null : Border.all(color: AppColors.background),
      ),
      child: Column(
        children: [
          if (isWinner) ...[
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 24.sp,
            ),
            8.height,
          ],
          CommonText(
            text: jobTitle,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isWinner ? AppColors.white : AppColors.black,
          ),
          12.height,
          CommonText(
            text: '৳ ${amount.toStringAsFixed(0)}',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isWinner ? AppColors.white : AppColors.primaryColor,
          ),
          4.height,
          CommonText(
            text: 'Annual Total',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isWinner ? AppColors.white.withOpacity(0.8) : AppColors.textFiledColor,
          ),
        ],
      ),
    );
  }
}
