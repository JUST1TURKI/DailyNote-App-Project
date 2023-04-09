import 'package:get/get.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  final taskList = <Task>[
    Task(
      title: 'Title1',
      note: 'Note Something',
      startTime: '20:18AM',
      endTime: '2:18PM',
      color: 0,
      isCompleted: 0,
    ),
    Task(
      title: 'Title1',
      note: 'Note Something',
      startTime: '20:18AM',
      endTime: '2:18PM',
      color: 0,
      isCompleted: 0,
    ),
  ];
  getTask() {}
}
