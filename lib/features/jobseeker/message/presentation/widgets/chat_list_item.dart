import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../data/model/chat_list_model.dart';
import '../../../../../core/utils/extensions/extension.dart';
import '../../../../../core/constants/app_colors.dart';

Widget chatListItem({required ChatModel item}) {
  String time = DateFormat('hh:mm a').format(item.latestMessage.createdAt);

  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.h),
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// participant image here
        CircleAvatar(
          radius: 22.r,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: CommonImage(imageSrc: item.participant.image, size: 44),
          ),
        ),
        12.width,

        /// Name & last message
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// participant Name here
              CommonText(
                text: item.participant.fullName,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              6.height,

              /// Last message with small status icon
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 14.sp,
                    color: AppColors.primaryColor,
                  ),
                  6.width,
                  Expanded(
                    child: CommonText(
                      text: item.latestMessage.message,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        12.width,

        /// Time and unread badge
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CommonText(
              text: time,
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
            8.height,
            Container(
              width: 20.r,
              height: 20.r,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF083E4B),
                    Color(0xFF074E5E),
                    Color(0xFF0288A6),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
                shape: BoxShape.circle,
              ),
              child: const CommonText(
                text: '2',
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
