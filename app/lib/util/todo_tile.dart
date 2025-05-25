import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const TodoTile({
    super.key,
    required this.taskname,
    required this.taskcompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), 
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete_outline,
            backgroundColor: const Color.fromARGB(255, 63, 39, 1) ,
            borderRadius: BorderRadius.circular(12),
            )
        ],),
        child: Container(
          padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(value: taskcompleted,
               onChanged: onChanged,
               activeColor: Colors.black,),
              // Task name with optional strikethrough
              Text(
                taskname,
                style: TextStyle(
                  decoration:
                      taskcompleted 
                      ? TextDecoration.lineThrough : 
                      TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}