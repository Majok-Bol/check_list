//handle database integration
import 'package:hive_flutter/hive_flutter.dart';
class Database {
  //initialize items
  List items=[];
  //reference the box
  final myBox=Hive.box('database');
  //carry out this function if its the first time
void createInitialData(){
  items=[
    ['Go to gym',false],
  ['Go to school',false]
  ];

}
//if not the first time
//load database data
void loadData(){
  items=myBox.get('items');
}
//update the database
void updateDatabase(){
  myBox.put('items', items);
}

}