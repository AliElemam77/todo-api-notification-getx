import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_workshop/core/theme/colors.dart';
import 'package:todo_workshop/core/helpers/font_weight_helper.dart';
import 'package:todo_workshop/core/theme/style/textstyle.dart';
import 'package:todo_workshop/core/widgets/text.dart';
import 'package:todo_workshop/features/auth/view/screens/login/login.dart';

class AlreadyHaveAccoountButton extends StatelessWidget {
  const AlreadyHaveAccoountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
      },
      child: ReusableText(
        text: 'already have account ?',
        style: textStyle(ColorsManger.twhite, 15.sp, FontWeightHelper.regular),
      ),
    );
  }
}
