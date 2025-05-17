import 'package:task_manager_project/data/models/task_status_count.dart';

class TaskStatusCount {
  late final String status;
  late final List<TaskStatusCountModel> statusCountList;

  TaskStatusCount.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData['status'];
    if (jsonData['data'] != null) {
          List<TaskStatusCountModel> list= [];
      for(Map<String, dynamic> data in jsonData['data']){
        list.add(TaskStatusCountModel.fromJson(data));
          }
      statusCountList = list;
    } else {
      statusCountList = [];
    }
  }
}
