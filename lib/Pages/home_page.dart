//handle home page
import 'package:check_list/Pages/dialog_box.dart';
import 'package:check_list/Pages/to_do_tile.dart';
import 'package:flutter/material.dart';
import 'package:check_list/Database/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  //create state to manage widget rebuild
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{
  //create database instance
  Database db=Database();
  //reference the box
  final myBox=Hive.box('database');
  //create database state
  @override
  void initState() {
    //if first this
    //check if there is data in the database
    if(myBox.get('items')==null){
      db.createInitialData();
      //if there is data
      //load the data
    }else{
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }


  //store task items
  //default values
  //sample data
  // List items=[
  //   ['Go to gym',false],
  //   ['Go to school',false]
  // ];
  //get text input
  final TextEditingController _controller=TextEditingController();
  //function to add task
  void addNewTask(){
    setState(() {
      showDialog(context: context, builder: (context){
        return DialogBox(onSave:saveNewTask, onCancel:(){
          Navigator.of(context).pop();

        }, itemController:_controller);
      });

    });
    //update the database
    db.updateDatabase();
  }
  //function to save new task
  void saveNewTask(){
    setState(() {
      db.items.add([_controller.text,false]);
      _controller.clear();


    });
    Navigator.of(context).pop();
    //update database
    db.updateDatabase();


  }
  //function to delete task
  void deleteTask(int index){
    setState(() {
      db.items.removeAt(index);



    });
    //update database
    db.updateDatabase();
  }
  //toggle checkbox
  void checkBoxChanged(bool?value,index){
    setState(() {
      db.items[index][1]=!db.items[index][1];
    });
    //update the database
    db.updateDatabase();


  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('To do Application'),centerTitle: true,backgroundColor: Colors.grey.shade400,elevation: 0,),
      body:ListView.builder(
        itemCount: db.items.length,
          itemBuilder:(context,index){
          return ToDoTile(taskName: db.items[index][0], taskCompleted:db.items[index][1], onChanged:(value)=>checkBoxChanged(value, index), deleteFunction:(context)=>deleteTask(index));
        
      }),
      floatingActionButton: FloatingActionButton(onPressed:addNewTask,backgroundColor: Colors.grey.shade500,child: Icon(Icons.add,size: 35,)),
    );
  }
}