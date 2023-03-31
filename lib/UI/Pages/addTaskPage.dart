import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_player_app/controller/task_controller.dart';
import '../colors.dart' as color;

import '../size_config.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({
    Key? key,
  }) : super(key: key);

  @override
  _AddTaskPage createState() => _AddTaskPage();
}

class _AddTaskPage extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];

  int _selectedColor = 0;

  final TextStyle _textStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final TextStyle _subStyle = const TextStyle(
    fontSize: 18,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(0.9),
              color.AppColor.gradientSecond,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -100),
              blurRadius: 70,
              color: Colors.black,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: color.AppColor.secondPageTitleColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InputField(
                          title: 'Title',
                          hint: 'Enter your title',
                          controller: _titleController,
                        ),
                        InputField(
                          title: 'Note',
                          hint: 'Enter your Note',
                          controller: _noteController,
                        ),
                        InputField(
                          title: 'Date',
                          hint: DateFormat.yMd().format(_selectedDate),
                          controller: _noteController,
                          widget: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                              )),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InputField(
                                title: 'Start Time',
                                hint: _startTime,
                                controller: _noteController,
                                widget: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.access_time_rounded,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: InputField(
                                title: 'End Time',
                                hint: _endTime,
                                controller: _noteController,
                                widget: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.access_time_rounded,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        InputField(
                          title: 'Remind',
                          hint: '$_selectedRemind minutes early',
                          controller: _noteController,
                          widget: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              dropdownColor: Colors.grey,
                              items: remindList
                                  .map<DropdownMenuItem<String>>(
                                    (int value) => DropdownMenuItem(
                                      value: value.toString(),
                                      child: Text(
                                        '$value',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              // ignore: prefer_const_constructors
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                              iconSize: 32,
                              elevation: 4,
                              underline: Container(height: 0),
                              style: _subStyle,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedRemind = int.parse(newValue!);
                                });
                              },
                            ),
                          ),
                        ),
                        InputField(
                          title: 'Repeat',
                          hint: _selectRepeat,
                          controller: _noteController,
                          widget: DropdownButton(
                            dropdownColor: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            items: repeatList
                                .map<DropdownMenuItem<String>>(
                                  (value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                                .toList(),
                            // ignore: prefer_const_constructors
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            ),
                            iconSize: 32,
                            elevation: 4,
                            underline: Container(height: 0),
                            style: _subStyle,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectRepeat = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
