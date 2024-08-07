import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_workshop/core/helpers/cache_helper.dart';
import 'package:todo_workshop/core/helpers/font_weight_helper.dart';
import 'package:todo_workshop/core/theme/colors.dart';
import 'package:todo_workshop/core/theme/style/textstyle.dart';
import 'package:todo_workshop/core/widgets/app_header.dart';
import 'package:todo_workshop/core/widgets/text.dart';
import 'package:todo_workshop/features/todo/logic/get_notes_controller.dart';
import 'package:todo_workshop/features/todo/view/screens/home/widgets/note_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/addNote');
        },
        backgroundColor: ColorsManger.tGray,
        child: const Icon(Icons.add, color: ColorsManger.twhite),
      ),
      body: Column(
        children: [
          SizedBox(height: 90.h),
          Align(
            alignment: Alignment.topCenter,
            child: AppHeader(
              iconOne: Icons.search,
              iconTwo: Icons.logout_sharp,
              onPressedTwo: () {
                CacheHelper.clearData();
                Get.toNamed('/login');
              },
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return Column(
                children: [
                  SizedBox(height: 350.h),
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  SizedBox(height: 30.h),
                  ReusableText(
                      text: 'Loading...',
                      style: textStyle(
                          ColorsManger.twhite, 30, FontWeightHelper.bold))
                ],
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.notes.length,
                  itemBuilder: (context, index) {
                    return NoteTile(index: index);
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
