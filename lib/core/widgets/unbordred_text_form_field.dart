import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_workshop/core/helpers/font_weight_helper.dart';
import 'package:todo_workshop/core/theme/colors.dart';
import 'package:todo_workshop/core/theme/style/textstyle.dart';

class UnborderdTextFormField extends StatelessWidget {
  const UnborderdTextFormField({
    super.key,
    this.hintText,
    this.maxLines,
    this.controller,
  });
  final String? hintText;
  final int? maxLines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: textStyle(ColorsManger.twhite, 50.sp,
            FontWeightHelper.light),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              textStyle(ColorsManger.twhite, 50.sp, FontWeightHelper.semiBold),
          border: InputBorder.none,
        ));
  }
}
