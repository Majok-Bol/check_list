//handle home page
import 'package:check_list/Pages/dialog_box.dart';
import 'package:check_list/Pages/to_do_tile.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  //create state to manage widget rebuild
  HomePageState createState()=>HomePageState();
}
class HomePageState extends State<HomePage>{
  //store task items
  //default values
  //sample data
  List items=[
    ['Go to gym',false],
    ['Go to school',false]
  ];
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
  }
  //function to save new task
  void saveNewTask(){
    setState(() {
      items.add([_controller.text,false]);
      _controller.clear();


    });
    Navigator.of(context).pop();


  }
  //function to delete task
  void deleteTask(int index){
    setState(() {
      items.removeAt(index);



    });
  }
  //toggle checkbox
  void checkBoxChanged(bool?value,index){
    setState(() {
      items[index][1]=!items[index][1];
    });


  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('To do Application'),centerTitle: true,backgroundColor: Colors.grey.shade400,elevation: 0,),
      body:ListView.builder(
        itemCount: items.length,
          itemBuilder:(context,index){
          return ToDoTile(taskName: items[index][0], taskCompleted:items[index][1], onChanged:(value)=>checkBoxChanged(value, index), deleteFunction:(context)=>deleteTask(index));
        
      }),
      floatingActionButton: FloatingActionButton(onPressed:addNewTask,backgroundColor: Colors.grey.shade500,child: Icon(Icons.add,size: 35,)),
    );
  }
}