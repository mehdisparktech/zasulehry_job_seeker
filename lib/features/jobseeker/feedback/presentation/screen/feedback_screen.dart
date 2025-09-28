import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/image/common_image.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_images.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppBar(title: AppString.feedback),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              // First feedback card
              _buildFeedbackCard(
                companyName: 'Google',
                timeAgo: '2 Month Ago',
                reviewText:
                    'Lorem Ipsum Dolor Sit Amet Consectetur. A Id Eu Turpis Amet Laoreet Aliquam. Vestibulum In Mattis Vitae Ipsum In Cras Nec Quis. Nisl Ullamcorper Urna Non Varius Egestas Tempor Leo. Turpis Risus Locus Molestudo Magna. Volutpat Pellentesque Quis Sit Rhoncus Vel Diam Ac Morbi. Etiam Facilisi Elit Pretium Nulla Dictum Ac Turpis Ac. Lacus Orci Massa Tellus Egestas Elementum Vulputate Dignissim Pretium. P',
                rating: 5,
              ),

              // Second feedback card
              _buildFeedbackCard(
                companyName: 'Google',
                timeAgo: '2 Month Ago',
                reviewText:
                    'Lorem Ipsum Dolor Sit Amet Consectetur. A Id Eu Turpis Amet Laoreet Aliquam. Vestibulum In Mattis Vitae Ipsum In Cras Nec Quis. Nisl Ullamcorper Urna Non Varius Egestas Tempor Leo. Turpis Risus Locus Molestudo Magna. Volutpat Pellentesque Quis Sit Rhoncus Vel Diam Ac Morbi. Etiam Facilisi Elit Pretium Nulla Dictum Ac Turpis Ac. Lacus Orci Massa Tellus Egestas Elementum Vulputate Dignissim Pretium. P',
                rating: 5,
              ),

              // Third feedback card
              _buildFeedbackCard(
                companyName: 'Google',
                timeAgo: '2 Month Ago',
                reviewText:
                    'Lorem Ipsum Dolor Sit Amet Consectetur. A Id Eu Turpis Amet Laoreet Aliquam. Vestibulum In Mattis Vitae Ipsum In Cras Nec Quis. Nisl Ullamcorper Urna Non Varius Egestas Tempor Leo. Turpis Risus Locus Molestudo Magna. Volutpat Pellentesque Quis Sit Rhoncus Vel Diam Ac Morbi. Etiam Facilisi Elit Pretium Nulla Dictum Ac Turpis Ac. Lacus Orci Massa Tellus Egestas Elementum Vulputate Dignissim Pretium. P',
                rating: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackCard({
    required String companyName,
    required String timeAgo,
    required String reviewText,
    required int rating,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with company logo, name and time
          Row(
            children: [
              // Company logo
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: const CommonImage(
                    imageSrc: AppImages.google,
                    size: 40,
                    fill: BoxFit.cover,
                  ),
                ),
              ),
              12.width,

              // Company name and time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: companyName,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                        CommonText(
                          text: timeAgo,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textFiledColor,
                        ),
                      ],
                    ),
                    4.height,

                    // Star rating
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: index < rating
                              ? Colors.amber
                              : AppColors.textFiledColor,
                          size: 20.sp,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),

          12.height,

          // Review text
          CommonText(
            text: reviewText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF555555),
            textAlign: TextAlign.left,
            maxLines: 8,
          ),
        ],
      ),
    );
  }
}