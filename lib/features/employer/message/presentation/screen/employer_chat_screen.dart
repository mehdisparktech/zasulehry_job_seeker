import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:zasulehry_job_seeker/core/component/other_widgets/common_loader.dart';
import 'package:zasulehry_job_seeker/core/component/screen/error_screen.dart';
import 'package:zasulehry_job_seeker/core/component/text_field/common_text_field.dart';
import 'package:zasulehry_job_seeker/core/config/route/app_routes.dart';
import 'package:zasulehry_job_seeker/core/constants/app_colors.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/enum/enum.dart';
import 'package:zasulehry_job_seeker/features/employer/message/data/model/employer_chat_list_model.dart';
import 'package:zasulehry_job_seeker/features/employer/message/presentation/controller/employer_chat_controller.dart';
import 'package:zasulehry_job_seeker/features/employer/message/presentation/widgets/employer_chat_list_item.dart';

class EmployerChatListScreen extends StatelessWidget {
  const EmployerChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    EmployerChatController.instance;

    return Scaffold(
      /// App Bar Section Starts here
      appBar: const CommonAppBar(
        title: AppString.inbox,
        leading: SizedBox.shrink(),
      ),

      backgroundColor: AppColors.background,

      /// Body Section Starts here
      body: GetBuilder<EmployerChatController>(
        builder: (controller) => switch (controller.status) {
          /// Loading bar here
          Status.loading => const CommonLoader(),

          /// Error Handle here
          Status.error => ErrorScreen(
            onTap: EmployerChatController.instance.getChatRepo,
          ),

          /// Show main data here
          Status.completed => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              children: [
                /// User Search bar here
                CommonTextField(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: AppString.searchHere,
                  fillColor: Colors.white,
                  borderRadius: 24,
                  borderColor: Colors.white,
                  paddingVertical: 12,
                ),

                /// Show all Chat List here
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.chats.length,
                    padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
                    itemBuilder: (context, index) {
                      EmployerChatListModel item = controller.chats[index];
                      return GestureDetector(
                        /// routing with data
                        onTap: () => Get.toNamed(
                          AppRoutes.employerMessage,
                          parameters: {
                            "chatId": item.id,
                            "name": item.participant.fullName,
                            "image": item.participant.image,
                          },
                        ),

                        /// Chat List item here
                        child: employerChatListItem(
                          item: controller.chats[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        },
      ),

      /// Bottom Navigation Bar Section Starts here
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 1),
    );
  }
}
