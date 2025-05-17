import 'package:flutter/material.dart';
import 'package:task_manager_project/data/models/task_list_model.dart';
import 'package:task_manager_project/data/models/task_model.dart';
import 'package:task_manager_project/data/models/task_status_count.dart';
import 'package:task_manager_project/data/models/task_status_count_list_model.dart';
import 'package:task_manager_project/data/service/network_client.dart';
import 'package:task_manager_project/data/utils/urls.dart';
import 'package:task_manager_project/ui/screens/add_new_task_screen.dart';
import 'package:task_manager_project/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager_project/ui/widgets/snack_bar_message.dart';

import '../widgets/summary_card.dart';
import '../widgets/task_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool isLoading = false;
  List<TaskStatusCountModel> _taskStatusCountList = [];

  bool _getNewTaskInProgress = false;
  List<TaskModel> _newTaskList = [];

  @override
  void initState() {
    // TODO: implement initState
    _getAllTaskStatus();
    _getAllNewTaskList();
    super.initState();
  }

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
            Visibility(
              visible: isLoading == false,
              replacement: CenteredCircularProgressIndicator(),
              child: buildSummarySection(),
            ),
            Visibility(
              visible: _getNewTaskInProgress = false,
              replacement: SizedBox(
                height: 300,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CenteredCircularProgressIndicator(),
                ),
              ),
              child: ListView.separated(
                itemCount: _newTaskList.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return task_card(
                    taskStatus: TaskStatus.sNew,
                    taskModel: _newTaskList[index],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8),
              ),
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
      primary: true,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _taskStatusCountList.length,
            itemBuilder: (context, index) {
              return summaryCard(
                title: _taskStatusCountList[index].status,
                count: _taskStatusCountList[index].count,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _getAllTaskStatus() async {
    isLoading = true;
    setState(() {});

    final NetworkResponse response = await NetworkClient.getRequest(
      url: Urls.taskStatusCount,
    );
    if (response.isSuccess) {
      TaskStatusCount taskStatusCountListModel = TaskStatusCount.fromJson(
        response.data ?? {},
      );

      _taskStatusCountList = taskStatusCountListModel.statusCountList;
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
    isLoading = false;
    setState(() {});
  }

  Future<void> _getAllNewTaskList() async {
    _getNewTaskInProgress = true;
    setState(() {});

    final NetworkResponse response = await NetworkClient.getRequest(
      url: Urls.newTaskListUrl,
    );
    if (response.isSuccess) {
      TaskListModel taskListModel = TaskListModel.fromJson(response.data ?? {});

      _newTaskList = taskListModel.taskList;
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
    _getNewTaskInProgress = false;
    setState(() {});
  }
}
