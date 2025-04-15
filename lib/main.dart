import 'package:flutter/material.dart';
import 'package:check_list/Pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async{
  //await for flutter to initialize the database
  await Hive.initFlutter();
  //call the box
  var box= await Hive.openBox('database');
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}