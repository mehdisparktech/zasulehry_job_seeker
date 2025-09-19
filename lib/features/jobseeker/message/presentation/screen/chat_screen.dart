import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import '../../../../../core/config/route/app_routes.dart';
import '../../../../../core/component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../../core/component/other_widgets/common_loader.dart';
import '../../../../../core/component/screen/error_screen.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../controller/chat_controller.dart';
import '../../data/model/chat_list_model.dart';
import '../../../../../core/utils/enum/enum.dart';
import '../../../../../core/constants/app_string.dart';
import '../widgets/chat_list_item.dart';
import '../../../../../core/constants/app_colors.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section Starts here
      appBar: const CommonAppBar(
        title: AppString.inbox,
        leading: SizedBox.shrink(),
      ),

      backgroundColor: AppColors.background,

      /// Body Section Starts here
      body: GetBuilder<ChatController>(
        builder: (controller) => switch (controller.status) {
          /// Loading bar here
          Status.loading => const CommonLoader(),

          /// Error Handle here
          Status.error => ErrorScreen(
            onTap: ChatController.instance.getChatRepo,
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
                      ChatModel item = controller.chats[index];
                      return GestureDetector(
                        /// routing with data
                        onTap: () => Get.toNamed(
                          AppRoutes.message,
                          parameters: {
                            "chatId": item.id,
                            "name": item.participant.fullName,
                            "image": item.participant.image,
                          },
                        ),

                        /// Chat List item here
                        child: chatListItem(item: controller.chats[index]),
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
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 2),
    );
  }
}
