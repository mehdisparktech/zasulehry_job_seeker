import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';

void showEmailDialog(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  final screenWidth = MediaQuery.of(context).size.width;
  double dialogWidth = screenWidth * 0.85;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: CommonText(text: "Add Email Address"),
            ),
            const SizedBox(height: 8),
            CommonTextField(
              controller: emailController,
              hintText: "Enter Email Address",
              fillColor: Colors.white,
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: dialogWidth,
              child: CommonButton(
                  titleText: "Submit")
          )
        ]
        ,
      );
    },
  );
}


