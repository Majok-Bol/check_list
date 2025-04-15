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
      content:Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(

          ),
          Row(children: [
            Buttons(text:'Save', onPressed:onSave),
            Buttons(text: 'Cancel', onPressed: onCancel)

          ],)
        ],),
      ) ,


    );






  }
}