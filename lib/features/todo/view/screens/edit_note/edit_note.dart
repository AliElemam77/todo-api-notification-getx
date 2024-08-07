import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_workshop/core/widgets/app_header.dart';
import 'package:todo_workshop/core/widgets/unbordred_text_form_field.dart';
import 'package:todo_workshop/features/todo/logic/get_notes_controller.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NoteController>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 90.h),
              AppHeader(
                withTitle: false,
                iconTwo: Icons.save_outlined,
                onPressedTwo: () {
                  controller.editNote(controller.notes[index].sId!);
                  Get.back();
                },
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    UnborderdTextFormField(
                      controller: controller.title,
                      hintText: 'Title',
                    ),
                    Divider(color: Colors.white.withOpacity(0.1)),
                    UnborderdTextFormField(
                        controller: controller.subtitle,
                        hintText: 'Description',
                        maxLines: 5),
                    Divider(color: Colors.white.withOpacity(0.1)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
