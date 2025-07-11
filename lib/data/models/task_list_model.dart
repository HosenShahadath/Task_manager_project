import 'package:task_manager_project/data/models/task_model.dart';

class TaskListModel {
  late final String status;
  late final List<TaskModel> taskList;

  TaskListModel.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData['status'];
    List<TaskModel> list = [];
    if(jsonData['data'] != null){
      for(Map<String,dynamic> data in jsonData['data']){
        list.add(TaskModel.fromJson(data));
      }
      taskList = list;
    }else {
      taskList = [];
    }
  }
}