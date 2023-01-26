import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/settings/settings.dart';
import 'package:todo/modules/tasks_list/add_task_bottom_sheet.dart';
import 'package:todo/modules/tasks_list/task_list.dart';
import 'package:todo/shared/providers/navbar_provider.dart';
import 'package:todo/shared/styles/colors.dart';



class HomeLayout extends StatelessWidget {
  static const routeName= "home";



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context)=> NavbarProvider(),
      builder: (context, child) {
        var provider = Provider.of<NavbarProvider>(context);
        return Scaffold(
            appBar: AppBar(
            title: Text("Tasks"),
          ),

          body: tabs[provider.currentIndex],
          floatingActionButton: FloatingActionButton(onPressed: (){ showAddTaskBottomSheet(context);
            }
          , child: Icon(Icons.add),
          shape: StadiumBorder(side: BorderSide(color: Colors.white)),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 8,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: provider.currentIndex,
              elevation: 0.0,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
              ],
              onTap: (index) => provider.changeNaveBar(index),
            ),
          ),
        );
      },
      );

  }

  void showAddTaskBottomSheet(context){
    showModalBottomSheet(context: context , builder: (context) {
      return Container(
          // padding: EdgeInsets.only(
          //     bottom: MediaQuery.of(context).viewInsets.bottom),
          height: MediaQuery.of(context).size.height*0.5,
          child: AddTaskBottomSheet()
      );
    }, isScrollControlled: true,
    );
  }

  List<Widget> tabs = [TasksList(),SettingsTab()];
}


