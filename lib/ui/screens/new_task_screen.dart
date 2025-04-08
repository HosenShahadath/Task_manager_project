import 'package:flutter/material.dart';

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
        onPressed: () {},
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
                return const task_card();
              },
              separatorBuilder: (context, index) => SizedBox(height: 8,),
            ),
          ],
        ),
      ),
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
