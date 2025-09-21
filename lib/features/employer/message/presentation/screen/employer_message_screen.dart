import 'package:flutter/material.dart';
import 'package:zasulehry_job_seeker/features/employer/message/data/model/employer_chat_message_model.dart';
import 'package:zasulehry_job_seeker/features/employer/message/presentation/widgets/employer_chat_bubble_message.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/text_field/common_text_field.dart';

import '../../../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/employer_message_controller.dart';
import '../../../../../core/constants/app_string.dart';

import '../../../../../core/constants/app_colors.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String chatId = Get.parameters["chatId"] ?? "";
  String name = Get.parameters["name"] ?? "";
  String image = Get.parameters["image"] ?? "";

  @override
  void initState() {
    MessageController.instance.name = name;
    MessageController.instance.chatId = chatId;
    MessageController.instance.getMessageRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,

          /// App Bar Section starts here
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 88.h,
            centerTitle: false,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(-0.9, 0),
                  end: Alignment(1.0, 0),
                  colors: [
                    Color(0xFF083E4B),
                    Color(0xFF074E5E),
                    Color(0xFF0288A6),
                  ],
                  stops: [0.0, 0.4, 1.0],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
            ),
            titleSpacing: 0,
            title: Padding(
              padding: EdgeInsets.only(left: 8.w, right: 12.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: CommonImage(imageSrc: image, size: 40),
                    ),
                  ),
                  10.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonText(
                          text: name,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                        CommonText(
                          text: AppString.activeNow,
                          fontSize: 12,
                          color: AppColors.white.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 34.r,
                    height: 34.r,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  8.width,
                ],
              ),
            ),
          ),

          /// Body Section starts here
          body: controller.isLoading
              /// Loading bar here
              ? const Center(child: CircularProgressIndicator())
              /// Show data  here
              : ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 8.w,
                  ),
                  controller: controller.scrollController,
                  itemCount: controller.isMoreLoading
                      ? controller.messages.length + 1
                      : controller.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    /// Message item here
                    if (index < controller.messages.length) {
                      ChatMessageModel message = controller.messages[index];
                      return ChatBubbleMessage(
                        index: index,
                        image: message.image,
                        time: message.time,
                        text: message.text,
                        isMe: message.isMe,
                        onTap: () {},
                      );
                    } else {
                      /// More data loading bar
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),

          /// bottom Navigation Bar Section starts here
          bottomNavigationBar: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: Container(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                bottom: 40.h,
                top: 8.h,
              ),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    /// Send message text filed here
                    child: CommonTextField(
                      hintText: AppString.typeHere,
                      fillColor: AppColors.white,
                      borderColor: Colors.grey,
                      borderRadius: 24,
                      paddingVertical: 12,
                      controller: controller.messageController,
                      onSubmitted: (p0) => controller.addNewMessage(),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.image_outlined),
                          ),
                        ],
                      ),
                    ),
                  ),
                  8.width,
                  GestureDetector(
                    onTap: controller.addNewMessage,
                    child: Container(
                      width: 44.r,
                      height: 44.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: const Icon(
                        Icons.send,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
