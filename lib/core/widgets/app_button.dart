import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_workshop/core/theme/colors.dart';
import 'package:todo_workshop/core/helpers/font_weight_helper.dart';
import 'package:todo_workshop/core/theme/style/textstyle.dart';
import 'package:todo_workshop/core/widgets/text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color = ColorsManger.twhite,
  });
  final void Function()? onPressed;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 70.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
        ),
        onPressed: onPressed,
        child: ReusableText(
          text: text,
          style:
              textStyle(ColorsManger.tBlack, 20.sp, FontWeightHelper.regular),
        ),
      ),
    );
  }
}
