import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_workshop/core/helpers/font_weight_helper.dart';
import 'package:todo_workshop/core/theme/colors.dart';
import 'package:todo_workshop/core/theme/style/textstyle.dart';
import 'package:todo_workshop/core/widgets/icon_button.dart';
import 'package:todo_workshop/core/widgets/text.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    this.withTitle = true,
    this.iconOne = Icons.visibility,
    required this.iconTwo,
    this.onPressedTwo,
  });
  final bool withTitle;
  final IconData iconOne, iconTwo;
  final void Function()? onPressedTwo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          withTitle
              ? ReusableText(
                  text: 'Notes',
                  style: textStyle(
                      ColorsManger.twhite, 43.sp, FontWeightHelper.semiBold),
                )
              : CustomIconButton(
                  icon: Icons.arrow_back, onPressed: () => Get.back()),
          const Spacer(),
          Row(
            children: [
              CustomIconButton(icon: iconOne),
              SizedBox(width: 16.w),
              CustomIconButton(
                icon: iconTwo,
                onPressed: onPressedTwo,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
