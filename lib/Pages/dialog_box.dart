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
    return Padding(
        padding:EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(

              decoration:InputDecoration(
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )

              ),

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Buttons(text: 'Save', onPressed:onSave),
                Buttons(text: 'Cancel', onPressed: onCancel),




              ],
            )

          ],

        ),
      ),
    );

  }
}