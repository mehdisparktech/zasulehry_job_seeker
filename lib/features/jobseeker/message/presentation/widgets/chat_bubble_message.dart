import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/text/common_text.dart';

class ChatBubbleMessage extends StatelessWidget {
  final DateTime time;
  final String text;
  final String image;
  final bool isMe;
  final int index;
  final int messageIndex;

  final VoidCallback onTap;

  const ChatBubbleMessage({
    super.key,
    required this.time,
    required this.text,
    required this.image,
    required this.isMe,
    required this.onTap,
    this.index = 0,
    this.messageIndex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Show sender's profile image for received messages
          if (!isMe && image.isNotEmpty)
            Row(
              children: [
                CircleAvatar(
                  radius: 16.r,
                  child: ClipOval(
                    child: CommonImage(
                      imageSrc: image,
                      size: 32,
                      fill: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
              ],
            ),

          // Message bubble
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
                minWidth: 60.w,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isMe ? 12.r : 4.r),
                  topRight: Radius.circular(isMe ? 4.r : 12.r),
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
                color: isMe ? AppColors.primaryColor : AppColors.white,
                border: !isMe
                    ? Border.all(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        width: 1,
                      )
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Message text
                  CommonText(
                    text: text,
                    fontSize: 14.sp,
                    color: isMe ? AppColors.white : AppColors.black,
                    maxLines: 100, // Allow many lines
                    textAlign: TextAlign.left,
                  ),

                  // Timestamp
                  SizedBox(height: 4.h),
                  CommonText(
                    text: _formatTime(time),
                    fontSize: 10.sp,
                    color: isMe
                        ? AppColors.white.withOpacity(0.7)
                        : AppColors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),

          // Show sender's profile image for sent messages
          if (isMe)
            Row(
              children: [
                SizedBox(width: 8.w),
                CircleAvatar(
                  radius: 16.r,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.person,
                    size: 16.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
