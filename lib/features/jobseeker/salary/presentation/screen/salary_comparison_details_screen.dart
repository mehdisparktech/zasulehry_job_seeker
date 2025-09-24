import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';

class SalaryComparisonDetailsScreen extends StatelessWidget {
  const SalaryComparisonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.salaryComparison),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonText(text: 'shows here all information this job category'),
            ],
          ),
        ),
      ),
    );
  }
}
