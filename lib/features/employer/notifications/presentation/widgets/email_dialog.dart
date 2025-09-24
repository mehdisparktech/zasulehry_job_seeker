import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/button/common_button.dart';
import 'package:zasulehry_job_seeker/core/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/features/employer/notifications/presentation/widgets/email_update.dart';

void showEmailEdit(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  final screenWidth = MediaQuery.of(context).size.width;
  double dialogWidth = screenWidth * 0.85;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(text: "Your Email Link",fontSize: 14,fontWeight: FontWeight.w500,),
                Row(
                  children: [
                    GestureDetector(onTap: (){showEmailDialog(Get.context!);},child: Icon(Icons.edit,color: AppColors.primaryColor,size: 24,)),
                    SizedBox(width: 4,),
                    Icon(Icons.delete,color: Colors.red,size: 24,),
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerLeft,
              child: CommonText(
                  text: "dkdsjfkd@gmail.com",
                color: AppColors.primaryColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: ()=>showEmailDialog(Get.context!),
            child: SizedBox(
                width: dialogWidth,
                child: CommonButton(
                    titleText: "Add/Change",
                  onTap: ()=>Get.back(),
                )
            ),
          )
        ]
        ,
      );
    },
  );
}


