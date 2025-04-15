//handle dialog box
import 'package:flutter/material.dart';
import 'package:check_list/Pages/buttons.dart';

class DialogBox extends StatelessWidget{
  //controller for text input
  final itemController;
  //function to handle on save button pressed
  VoidCallback onSave;
  //function to handle on cancel button pressed
  VoidCallback onCancel;
   DialogBox({super.key,required this.onSave,required this.onCancel,required this.itemController});

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.blue.shade50,
      content:Container(

        height: 120,
        padding: EdgeInsets.all( 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: itemController,
            decoration: InputDecoration(
              hintText: 'Add new task',
              border: OutlineInputBorder(),
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Buttons(text:'Save', onPressed:onSave),
            SizedBox(width: 20,),
            Buttons(text: 'Cancel', onPressed: onCancel)

          ],)
        ],),
      ) ,


    );






  }
}