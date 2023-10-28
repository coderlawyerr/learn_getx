import 'package:flutter_application_1/model/model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;

  void addTask(String title) {
    taskList.add(Task(title));
  }

  void toggleStar(Task task) {
    task.isStarred = !task.isStarred;
  }

  void removeTask(Task task) {
    taskList.remove(task);
  }
}
