import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/screens/add_new_task_screen.dart';

import '../widgets/summary_card.dart';
import '../widgets/task_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTask,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSummarySection(),
            ListView.separated(
              itemCount: 6,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const task_card(taskStatus: TaskStatus.sNew);
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapAddNewTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNewTaskScreen()),
    );
  }

  SingleChildScrollView buildSummarySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            summaryCard(title: 'New', count: 12),
            summaryCard(title: 'progress', count: 23),
            summaryCard(title: 'Completed', count: 3),
            summaryCard(title: 'Cancelled', count: 10),
          ],
        ),
      ),
    );
  }
}
