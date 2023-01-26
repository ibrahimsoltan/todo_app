import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/mytheme.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

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
            key: formKey ,
              child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if(value != null && value.isEmpty){
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
                  controller: titleController,
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
          Text(
            "22/12/2022",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(onPressed: () {
            if(formKey.currentState!.validate()){
              print("here");
            }
          }, child: Text("Add Task"))
        ],
      ),
    );
  }
}
