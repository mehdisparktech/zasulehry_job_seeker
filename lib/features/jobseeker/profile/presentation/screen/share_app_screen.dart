import 'package:flutter/material.dart';
import '../../../../../core/component/appbar/common_app_bar.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/constants/app_string.dart';

class ShareAppScreen extends StatelessWidget {
  const ShareAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: AppString.shareApp,
      ),
      body: const Center(
        child: CommonText(
          text: "Share App Screen",
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}