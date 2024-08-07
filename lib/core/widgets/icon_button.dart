import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_workshop/core/theme/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManger.tGray,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: ColorsManger.twhite),
      ),
    );
  }
}
