import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_player_app/UI/widgets/button.dart';
import 'package:video_player_app/UI/widgets/task_tile.dart';
import 'package:video_player_app/controller/task_controller.dart';
import '../../models/task.dart';
import '../../services/notification_services.dart';
import '../colors.dart' as color;
import '../size_config.dart';
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
          // child: SingleChildScrollView(
          child: Column(
            children: [
              _AddTask(),
              _AddDate(),
              SizedBox(height: 10),
              _showTasks(),
            ],
          ),
          // ),
        ));
  }

  Future<void> _onRefresh() async {
    _taskController.getTask();
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        if (_taskController.taskList.isEmpty) {
          return _noTaskMsg();
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              var task = _taskController.taskList[index];
              var hour = task.startTime.toString().split(":")[0];
              var minutes = task.startTime.toString().split(":")[1];
              var date = DateFormat.jm().parse(task.startTime!);
              var myTime = DateFormat('HH:mm').format(date);
              SizeConfig().init(context);
              NotifyHelper().scheduledNotification(
                int.parse(myTime.toString().split(":")[0]),
                int.parse(myTime.toString().split(":")[1]),
                task,
              );
              return AnimationConfiguration.staggeredList(
                duration: const Duration(milliseconds: 750),
                position: index,
                child: SlideAnimation(
                  horizontalOffset: 300,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () => showBottomSheet(context, task),
                      child: TaskTile(
                        task: task,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: _taskController.taskList.length,
          );
        }
      }),
    );
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

  showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 4),
          height: task.isCompleted == 1
              ? SizeConfig.screenHeight * 0.15
              : SizeConfig.screenHeight * 0.23,
          color: Colors.white.withOpacity(0.1),
          child: Column(
            children: [
              Flexible(
                child: Container(
                  height: 6,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              task.isCompleted == 1
                  ? Container()
                  : _buildBottomSheet(
                      label: 'Task Completed',
                      onTap: () {
                        Get.back();
                      },
                      clr: Colors.black,
                    ),
              _buildBottomSheet(
                label: 'Delete Task',
                onTap: () {
                  Get.back();
                },
                clr: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildBottomSheet(
      {required String label,
      required Function() onTap,
      required Color clr,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 65,
        width: SizeConfig.screenWidth * 0.8,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose ? Colors.grey : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
