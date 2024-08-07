import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_workshop/core/helpers/font_weight_helper.dart';
import 'package:todo_workshop/core/theme/colors.dart';
import 'package:todo_workshop/core/theme/style/textstyle.dart';
import 'package:todo_workshop/core/widgets/text.dart';
import 'package:todo_workshop/features/todo/logic/get_notes_controller.dart';
import 'package:todo_workshop/features/todo/view/screens/edit_note/edit_note.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NoteController>();
    return GestureDetector(
      onTap: () {
        controller.title.text = controller.notes[index].title!;
        controller.subtitle.text = controller.notes[index].subtitle!;
        Get.to(EditNote(index: index));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorsManger.tGray,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: ReusableText(
                text: controller.notes[index].title!,
                style:
                    textStyle(ColorsManger.twhite, 30, FontWeightHelper.bold)),
            subtitle: ReusableText(
                text: controller.notes[index].subtitle ?? '',
                style: textStyle(
                    ColorsManger.twhite, 30, FontWeightHelper.extraLight)),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 40.r),
              onPressed: () {
                final id = controller.notes[index].sId;
                controller.delete(id);
              },
            ),
          ),
        ),
      ),
    );
  }
}
