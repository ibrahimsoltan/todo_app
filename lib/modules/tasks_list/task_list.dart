import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/modules/tasks_list/task_item.dart';
import 'package:todo/shared/network/local/firebas_utils.dart';
import 'package:todo/shared/styles/colors.dart';

import '../../models/task.dart';

class TasksList extends StatefulWidget {
   TasksList({Key? key}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  DateTime selectedDate =DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CalendarTimeline(
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),
        onDateSelected: (date) { selectedDate = date; setState(() {

        });},
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
        child: FutureBuilder<QuerySnapshot<Task>>(builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return const Center(child: Text("Error"));
          }
          var tasks = snapshot.data?.docs.map((e) => e.data()).toList()??[];
          return ListView.builder(itemBuilder: (context, index) {
            return TaskItem(tasks[index]);
          },itemCount: tasks?.length,);
        }, future: getTasksFromFireStore(selectedDate),
        ),
      )
    ]);
  }
}
