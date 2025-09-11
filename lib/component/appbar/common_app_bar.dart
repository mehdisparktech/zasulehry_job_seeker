import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/component/text/common_text.dart';
import 'package:zasulehry_job_seeker/utils/constants/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? leadingColor;
  final Color? actionsColor;
  final Color? shapeColor;
  final Color? elevationColor;
  final double? toolbarHeight;
  final Widget? leading;
  final List<Widget>? actions;
  final bool isBackButton;
  final double? elevation;
  final double? shapeRadius;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final bool? isCenterTitle;
  final bool? isShowBackButton;
  const CommonAppBar({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.white,
    this.titleColor = AppColors.black,
    this.leadingColor = AppColors.black,
    this.actionsColor = AppColors.black,
    this.shapeColor = AppColors.black,
    this.elevationColor = AppColors.black,
    this.toolbarHeight = 80,
    this.leading,
    this.actions,
    this.isBackButton = true,
    this.elevation = 0,
    this.shapeRadius = 20,
    this.titleFontSize = 20,
    this.titleFontWeight = FontWeight.w600,
    this.isCenterTitle = true,
    this.isShowBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: CommonText(
        text: title,
        fontSize: titleFontSize ?? 20,
        fontWeight: titleFontWeight ?? FontWeight.w600,
        color: titleColor ?? AppColors.black,
      ),
      centerTitle: isCenterTitle,
      leading: isShowBackButton ?? true
          ? IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            )
          : leading,
      actions: actions,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(shapeRadius!),
          bottomRight: Radius.circular(shapeRadius!),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
