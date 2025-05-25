import 'package:app/util/mybutton.dart';
import 'package:flutter/material.dart';
class Dialoguebox extends StatelessWidget {
  final controller;
  final  VoidCallback onSave;
 final  VoidCallback OnCancel;

   const Dialoguebox(
    {super.key,
    required this.controller,
    required this.onSave,
    required this.OnCancel,
});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
    content: SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
             //get user input
          TextField(
            controller: controller ,
            decoration:
             InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
              ),
             ),

          //buttons save cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            
            
            children: [
              
               //save
               Mybutton(text: "save", 
               
               onPressed: onSave),
               const SizedBox(width: 8),

               //cancel
              Mybutton(text: "cancel", 
              onPressed: OnCancel),

            ],
          )
        ],
      ),
    ),
   

    );
  }
}
