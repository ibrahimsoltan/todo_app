import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/modules/tasks_list/task_item.dart';
import 'package:todo/shared/styles/colors.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CalendarTimeline(
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),
        onDateSelected: (date) => print("$date"),
        leftMargin: 20,
        monthColor: colorBlue,
        dayColor: Colors.black,
        activeDayColor: Colors.white,
        activeBackgroundDayColor: colorBlue,
        dotsColor: Color(0xFF333A47),
        selectableDayPredicate: (date) => date.day != 23,
        locale: 'en_ISO',
      ),
      Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TaskItem();
          },
        ),
      )
    ]);
  }
}
