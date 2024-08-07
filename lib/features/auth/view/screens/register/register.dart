import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_workshop/core/theme/colors.dart';
import 'package:todo_workshop/core/helpers/font_weight_helper.dart';
import 'package:todo_workshop/core/theme/style/textstyle.dart';
import 'package:todo_workshop/core/widgets/app_button.dart';
import 'package:todo_workshop/core/widgets/text.dart';
import 'package:todo_workshop/core/widgets/text_fom_field.dart';
import 'package:todo_workshop/features/auth/view/screens/register/widgets/already_have_account_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 150.h),
                  ReusableText(
                    text: 'Create new account',
                    style: textStyle(
                        ColorsManger.twhite, 30.sp, FontWeightHelper.bold),
                  ),
                  SizedBox(height: 15.h),
                  ReusableText(
                    text: 'please fill in the form to continue',
                    style: textStyle(
                        ColorsManger.twhite, 20.sp, FontWeightHelper.light),
                  ),
                  SizedBox(height: 90.h),
                  const AppTextFormField(hintText: 'Username'),
                  const AppTextFormField(hintText: 'Email'),
                  const AppTextFormField(hintText: 'Password'),
                  SizedBox(height: 90.h),
                  const AppButton(text: 'Sign Up'),
                  const AlreadyHaveAccoountButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
