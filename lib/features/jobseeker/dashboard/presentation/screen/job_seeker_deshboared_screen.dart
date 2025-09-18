import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';

class JobSeekerDeshboaredScreen extends StatelessWidget {
  const JobSeekerDeshboaredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Job Seeker Dashboard')),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 1),
    );
  }
}
