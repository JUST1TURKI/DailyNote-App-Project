import 'package:get/get.dart';
import 'package:video_player_app/db/db_helper.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  final RxList<Task> taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) {
    return DBHelper.insert(task);
  }

  // ? GET DATA FROM DATABASE
  Future<void> getTask() async {
    // ignore: unused_local_variable
    List<Map<String, dynamic>> task = await DBHelper.query(null);
    taskList.assignAll(task.map((data) => Task.fromJson(data)).toList());
  }

  // ? DELETE DATA FROM DATABASE
  void deleteTask({required Task task}) async {
    // ignore: unused_local_variable
    await DBHelper.delete(task);
    getTask();
  }

  // ? UPDATE DATA FROM DATABASE
  void markTaskCompleted(int id) async {
    // ignore: unused_local_variable
    await DBHelper.update(id);
    getTask();
  }
}
