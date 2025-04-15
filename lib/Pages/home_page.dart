//handle home page
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  @override
  const HomePage({super.key});
  //create state to manage widget rebuild
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('To do Application'),centerTitle: true,backgroundColor: Colors.grey.shade400,elevation: 0,),
    );
  }
}