class Urls {
  static const String _baseUrl = 'http://35.73.30.144:2005/api/v1';

  static const String registerUrl = '$_baseUrl/Registration';
  static const String loginUrl = '$_baseUrl/Login';
  static const String updateProfileUrl = '$_baseUrl/ProfileUpdate';
  static const String createTask = '$_baseUrl/createTask';
  static const String  taskStatusCount= '$_baseUrl/taskStatusCount';
  static const String  newTaskListUrl= '$_baseUrl/listTaskByStatus/New';
}