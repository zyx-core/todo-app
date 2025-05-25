import 'package:app/util/dialoguebox.dart';
import 'package:app/util/todo_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//
//
//
//text controller

final _controller = TextEditingController();
   //list of to do task
  List toDoList = [
    ["make tutorial",false],
    ["Do exrcise",false],
  ];

//check box was tapped
void checkBoxChanged(bool? value,int index){
  setState((){
    toDoList[index][1]=!toDoList[index][1];
  }
  
  );

}
//save new task
void saveNewTask(){
  setState(() {
    toDoList.add([_controller.text,false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
}

//create new task
void createnewtask(){
  showDialog(
    context: context,
   builder: (context)
   {
    return Dialoguebox(
      controller: _controller,
      onSave: saveNewTask,
      OnCancel:() => Navigator.of(context).pop(),
      );
   },
   );
  }

  //delte task

  void deleteTask(int index){
    setState(() {
      
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 124, 124, 12),
      appBar:AppBar(
        title: Text('TO DO'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 226, 204, 10),
      ) ,
     floatingActionButton: FloatingActionButton(onPressed:createnewtask,
     child: Icon(Icons.add), ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          
          return TodoTile(
            taskname: toDoList[index][0], 
          taskcompleted: toDoList[index][1], 
          onChanged:(value)=> checkBoxChanged(value,index),
          deleteFunction: (context) => deleteTask(index),
          );
 
          
        },

      ),
    );
  }
}