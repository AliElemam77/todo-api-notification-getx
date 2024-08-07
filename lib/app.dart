import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_workshop/core/theme/colors.dart';
import 'package:todo_workshop/features/auth/view/screens/login/login.dart';
import 'package:todo_workshop/features/auth/view/screens/register/register.dart';
import 'package:todo_workshop/features/todo/view/screens/add_note/add_note.dart';
import 'package:todo_workshop/features/todo/view/screens/home/home.dart';
import 'package:todo_workshop/middleware/auth_middleware.dart';
import 'package:todo_workshop/notification.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 1100),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        theme: ThemeData(
            primaryColor: ColorsManger.primaryColor,
            scaffoldBackgroundColor: ColorsManger.primaryColor),
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        getPages: [
          GetPage(
            name: "/login",
            page: () => const LoginPage(),
            middlewares: [AuthMiddleware()],
          ),
          GetPage(name: '/register', page: () => const RegisterPage()),
          GetPage(name: '/home', page: () => const Home()),
          GetPage(name: '/notification', page: () => const NotificationPage()),
          GetPage(name: '/addNote', page: () => const AddNote()),
        ],
      ),
    );
  }
}
