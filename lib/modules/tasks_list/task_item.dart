import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors.dart';

import '../../models/task.dart';

class TaskItem extends StatelessWidget {
  Task task;
  TaskItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 3,
            color: colorBlue,
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  task.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: colorBlue),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(task.description),
              ],
            ),
          )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: colorBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.only(left: 5),
              child: const Icon(
                Icons.done,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
