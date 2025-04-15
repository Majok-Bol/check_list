//handle buttons
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget{
  //text for the button
  final String text;
  //handle button pressed
  //function to handle button pressed
final VoidCallback onPressed;
 const Buttons({super.key,required this.text,required this.onPressed});
 @override
  Widget build(BuildContext context){
   return MaterialButton(
     color: Colors.blue.shade50,
       onPressed: onPressed);

 }

}