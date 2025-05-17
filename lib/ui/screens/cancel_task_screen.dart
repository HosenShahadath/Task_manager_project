import 'package:flutter/material.dart';
import '../widgets/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 6,
        itemBuilder: (context, index) {
          // return const task_card(taskStatus: TaskStatus.cancelled,);
        },
        separatorBuilder: (context, index) => SizedBox(height: 8,),
      ),
    );
  }
}
