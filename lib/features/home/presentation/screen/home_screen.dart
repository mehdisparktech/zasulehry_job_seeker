import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/component/bottom_nav_bar/common_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Home',
        isShowBackButton: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_2_outlined),
        ),
      ),
      body: const Center(child: Text('Home')),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 0),
    );
  }
}
