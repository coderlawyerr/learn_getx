import 'package:flutter/material.dart';
import 'package:flutter_application_1/control/control.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: TaskListScreen(),
    ),
  );
}

class TaskListScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController taskControllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Görev Listesi'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: taskController.taskList.length,
            itemBuilder: (context, index) {
              final task = taskController.taskList[index];
              return ListTile(
                title: Text(task.title),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: task.isStarred
                          ? Icon(Icons.star, color: Colors.blue)
                          : Icon(Icons.star_border),
                      onPressed: () {
                        taskController.toggleStar(task);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        taskController.removeTask(task);
                      },
                    ),
                  ],
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Görev Ekle'),
                content: TextField(controller: taskControllerText),
                actions: [
                  TextButton(
                    onPressed: () {
                      final taskTitle = taskControllerText.text;
                      if (taskTitle.isNotEmpty) {
                        taskController.addTask(taskTitle);
                        taskControllerText.clear();
                        Get.back();
                      }
                    },
                    child: Text('Ekle'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
