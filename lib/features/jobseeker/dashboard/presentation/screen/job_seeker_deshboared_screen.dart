import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/item.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';

class JobSeekerDeshboaredScreen extends StatelessWidget {
  const JobSeekerDeshboaredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.dashboard, isBackButton: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Item(
                icon: Icons.person,
                title: AppString.myAppliedJobs,
                onTap: () {},
              ),

              /// Change password Item here
              Item(
                title: AppString.approvedJobs,
                icon: Icons.lock_outline,
                onTap: () {},
              ),

              /// Terms of Service Item here
              Item(
                title: AppString.pendingJobs,
                icon: Icons.pending,
                onTap: () {},
              ),

              /// Privacy Policy Item here
              Item(
                onTap: () {},
                title: AppString.canceledJobs,
                icon: Icons.cancel,
              ),

              /// Delete Account Item here
              Item(
                title: AppString.savedJobs,
                icon: Icons.favorite,
                onTap: () {},
              ),

              Item(icon: Icons.feed, title: AppString.feedback, onTap: () {}),

              /// Log Out item here
              Item(
                icon: Icons.document_scanner_outlined,
                title: AppString.jobsinAppResumeCreation,
                onTap: () {},
              ),
              Item(
                icon: Icons.calculate,
                title: AppString.salaryCalculator,
                onTap: () {},
              ),
              Item(
                icon: Icons.compare,
                title: AppString.salaryComparison,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 1),
    );
  }
}
