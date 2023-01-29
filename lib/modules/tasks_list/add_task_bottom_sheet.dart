import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/components/ui_utils.dart';
import 'package:todo/shared/network/local/firebas_utils.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/mytheme.dart';

import '../../models/task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());
  var descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add new Task",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: colorBlack),
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please Enter title";
                      }
                      return null;
                    },
                    controller: titleController,
                    decoration: InputDecoration(
                      label: Text(
                        "Title",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: colorBlue)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      controller: descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        label: Text(
                          "Description",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      )),
                ],
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            "Select Date",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              SelectDate(context);
            },
            child: Text(
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Task task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: selectedDate
                          .microsecondsSinceEpoch);
                  showLoading("Adding task in progress", context);
                  addTaskToFireStore(task).then((value) {hideLoading(context);
                    showMessage("Task Added successfully", context, "ok", (){Navigator.pop(context);Navigator.pop(context);});

                  }).catchError((error){print(error);});

                }

              },
              child: Text("Add Task"))
        ],
      ),
    );
  }

  void SelectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate == null) return null;
    selectedDate = DateUtils.dateOnly(chosenDate);
    setState(() {});
  }
}
