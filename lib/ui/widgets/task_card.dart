import 'package:flutter/material.dart';

enum TaskStatus{
  sNew,
  progress,
  completed,
  cancelled,
}

class task_card extends StatelessWidget {
  const task_card({
    super.key,
    required this.taskStatus,
  });

  final TaskStatus taskStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title will be here', style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600,
            ),),
            Text('Desciption will be here'),
            Text('Date : 12/23/25'),
            Row(
              children: [
                Chip(
                  label: Text('New', style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  backgroundColor: _getStatusChipColor(),
                  side: BorderSide.none,
                ),
                const Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusChipColor(){
    late Color color;

    switch(taskStatus){

      case TaskStatus.sNew:
        color = Colors.blue;
      case TaskStatus.progress:
        color = Colors.purple;
      case TaskStatus.completed:
        color = Colors.green;
      case TaskStatus.cancelled:
        color = Colors.red;
    }

    return color;
  }

}