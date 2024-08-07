import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_workshop/core/theme/colors.dart';
import 'package:todo_workshop/core/helpers/font_weight_helper.dart';
import 'package:todo_workshop/core/theme/style/textstyle.dart';
import 'package:todo_workshop/core/widgets/app_button.dart';
import 'package:todo_workshop/core/widgets/text.dart';
import 'package:todo_workshop/core/widgets/text_fom_field.dart';
import 'package:todo_workshop/features/auth/logic/controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Center(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(height: 150.h),
                    ReusableText(
                      text: 'Welcome Back!',
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
                    Form(
                      // key: controller.formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                              controller: controller.emailController,
                              hintText: 'Email'),
                          AppTextFormField(
                              controller: controller.passwordController,
                              hintText: 'Password'),
                        ],
                      ),
                    ),
                    SizedBox(height: 90.h),
                    AppButton(
                        onPressed: () {
                          controller.login();
                        },
                        text: 'Login'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
