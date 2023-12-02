import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo_app/view/create_todo.dart';
import 'package:todo_app/model/todo_model.dart';

class InformationComponent extends StatelessWidget {
  final ToDo toDo;
  InformationComponent({super.key, required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(toDo.taskTitle, style: primaryTextStyle(size: 21)),
            Spacer(),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(toDo.taskPriority),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text(toDo.taskDescription, style: primaryTextStyle(size: 16)),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(toDo.selectedDate),
          ],
        ),
      ],
    );
  }
}
