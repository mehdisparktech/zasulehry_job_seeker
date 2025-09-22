import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/text/common_text.dart';

class EmployerChatBubbleMessage extends StatelessWidget {
  final DateTime time;
  final String text;
  final String image;
  final bool isMe;
  final int index;
  final int messageIndex;

  final VoidCallback onTap;

  const EmployerChatBubbleMessage({
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Show sender's profile image for received messages
          if (!isMe && image.isNotEmpty)
            Row(
              children: [
                CircleAvatar(
                  radius: 14.r,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.45,
                    minWidth: 60.w,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                      bottomLeft: Radius.circular(isMe ? 12.r : 4.r),
                      bottomRight: Radius.circular(isMe ? 4.r : 12.r),
                    ),
                    color: isMe ? AppColors.primaryColor : AppColors.blue100,
                    border: !isMe
                        ? Border.all(
                            color: AppColors.primaryColor.withOpacity(0.2),
                            width: 1,
                          )
                        : null,
                  ),
                  child: CommonText(
                    text: text,
                    fontSize: 16.sp,
                    color: isMe ? AppColors.white : AppColors.black,
                    maxLines: 100, // Allow many lines
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4.h),
                CommonText(
                  text: "${_formatTime(time)} Pm",
                  fontSize: 14.sp,
                  color: AppColors.textFiledColor,
                ),
              ],
            ),
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
