import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_workshop/core/theme/colors.dart';
import 'package:todo_workshop/core/helpers/font_weight_helper.dart';
import 'package:todo_workshop/core/theme/style/textstyle.dart';
import 'package:todo_workshop/core/widgets/text.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.obscureText = false,
    required this.hintText,
    this.controller,
    this.validator,
  });
  final TextEditingController? controller;
  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: TextFormField(
        style: textStyle(Colors.white, 20, FontWeight.normal),
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: ColorsManger.twhite),
              borderRadius: BorderRadius.circular(12.r)),
          enabled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: ColorsManger.twhite),
              borderRadius: BorderRadius.circular(12.r)),
          filled: true,
          fillColor: ColorsManger.tGray,
          label: ReusableText(
            text: hintText,
            style:
                textStyle(ColorsManger.twhite, 18.sp, FontWeightHelper.light),
          ),
        ),
      ),
    );
  }
}
