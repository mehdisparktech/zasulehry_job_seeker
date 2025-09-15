import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/component/appbar/common_app_bar.dart';

class ViewJobDetailsScreen extends StatelessWidget {
  const ViewJobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CommonAppBar(title: 'Job Details'));
  }
}
