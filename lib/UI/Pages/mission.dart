import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_player_app/UI/widgets/button.dart';
import 'package:video_player_app/controller/task_controller.dart';
import '../colors.dart' as color;
import 'addTaskPage.dart';

class Missions extends StatefulWidget {
  const Missions({Key? key}) : super(key: key);
  @override
  _Missions createState() => _Missions();
}

class _Missions extends State<Missions> {
  final TaskController _taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.AppColor.gradientFirst,
                  color.AppColor.gradientSecond,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60), topRight: Radius.circular(60))),
          child: Column(
            children: [
              _AddTask(),
              _AddDate(),
              Expanded(child: _noTaskMsg()),
            ],
          ),
        ));
  }

// ! Add Date
  Container _AddDate() {
    return Container(
      margin: EdgeInsets.only(left: 8),
      child: DatePicker(
        DateTime.now(),
        width: 70,
        height: 90,
        selectedTextColor: Colors.white,
        selectionColor: Color(0x880006BE),
        initialSelectedDate: DateTime.now(),
        dateTextStyle: TextStyle(fontSize: 24),
        onDateChange: (newDate) {
          setState(() {
            _selectedDate = newDate;
          });
        },
      ),
    );
  }

// ! Add Task
  Padding _AddTask() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                'Daily Missions',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    DateFormat.EEEE().format(DateTime.now()),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    DateFormat.yMMMd().format(DateTime.now()),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: MyButton(
              label: 'add Task',
              onTap: () async {
                await Get.to(const AddTaskPage());
                _taskController.getTask();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(seconds: 2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                SvgPicture.asset(
                  'assets/task.svg',
                  height: 60,
                  semanticsLabel: 'Task',
                  color: Colors.black.withOpacity(0.4),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    'No Tasks there',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
