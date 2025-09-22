import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';

class AiToolsScreen extends StatefulWidget {
  const AiToolsScreen({super.key});

  @override
  State<AiToolsScreen> createState() => _AiToolsScreenState();
}

class _AiToolsScreenState extends State<AiToolsScreen> {
  // AI Tools state management
  final Map<String, bool> _aiToolsStatus = {
    'AI Candidate Matching': false,
    'CV Screening & Ranking': true,
    'Job Description Optimization': true,
    'AI Chatbots': false,
    'Predictive Analytics': true,
    'Candidate Engagement': true,
    'Fraud Verification': true,
    'Salary & Market Insights': true,
    'Job Market Trend': false,
    'Automated Offer Generation': true,
    'Predictive Hiring Timeline': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.aiTools, isBackButton: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          children: [
            // AI Tools List
            Container(
              decoration: BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: _aiToolsStatus.entries.map((entry) {
                  return _buildAiToolItem(
                    title: entry.key,
                    isEnabled: entry.value,
                    onToggle: (value) {
                      setState(() {
                        _aiToolsStatus[entry.key] = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildAiToolItem({
    required String title,
    required bool isEnabled,
    required ValueChanged<bool> onToggle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.blue500, width: 1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          // Bullet point
          Container(
            width: 6.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 16.w),
          // Tool name
          Expanded(
            child: CommonText(
              text: title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              textAlign: TextAlign.left,
              maxLines: 2,
            ),
          ),
          // Toggle switch
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: isEnabled,
              onChanged: onToggle,
              activeColor: AppColors.white,
              activeTrackColor: AppColors.primaryColor,
              inactiveThumbColor: AppColors.white,
              inactiveTrackColor: AppColors.textFiledColor.withOpacity(0.5),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
