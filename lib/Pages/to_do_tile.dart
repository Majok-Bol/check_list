//handle list builder items
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget{
  //taskName
  //used to set task item as string text
  String taskName;
  //check if task is completed
  bool taskCompleted;

  //check box
  Function(bool?)?onChanged;
  //function to delete items
  Function(BuildContext)?deleteFunction;
  ToDoTile({super.key,required this.taskName,required this.taskCompleted,required this.onChanged,required this.deleteFunction});


  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(10),
        child:Slidable(
          endActionPane: ActionPane(motion:StretchMotion(), children:[

    ]),
    child: Container(
    padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(value:taskCompleted, onChanged: onChanged),
          Text(taskName),
        ],
      ),
    ),
        ),





    );

  }

}