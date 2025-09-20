import 'package:flutter/material.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/constants/app_string.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: AppString.personalInformation,
      ),
      body: const Center(
        child: CommonText(
          text: AppString.personalInformation,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}