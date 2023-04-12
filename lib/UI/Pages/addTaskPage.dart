import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_player_app/UI/Pages/home_page.dart';
import 'package:video_player_app/controller/task_controller.dart';
import 'package:video_player_app/services/notification_services.dart';
import '../../models/task.dart';
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
    Size size = MediaQuery.of(context).size;
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
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                          // NotifyHelper().disolayNotification(
                          //   title: 'Back To Home Page',
                          //   body: 'SIIUUU',
                          // );
                          // NotifyHelper().scheduledNotification();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 22,
                          color: color.AppColor.secondPageIconColor,
                        )),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: color.AppColor.secondPageTitleColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: size.height * 0.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/AddTask.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(42),
                    topLeft: Radius.circular(42),
                  ),
                  image: DecorationImage(
                    alignment: Alignment.bottomLeft,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/AddTaskFour.png'),
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
                          widget: IconButton(
                              onPressed: () => _getDateFromUser(),
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
                                widget: IconButton(
                                  onPressed: () =>
                                      _getTimeFromUser(isStartTime: true),
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
                                widget: IconButton(
                                  onPressed: () =>
                                      _getTimeFromUser(isStartTime: false),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _colorPalette(),
                              MyButton(
                                  label: 'Create',
                                  onTap: () {
                                    _validateDate();
                                  })
                            ],
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

  _validateDate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar(
        'required',
        'All fields are required',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white.withOpacity(0),
        colorText: Colors.red,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
        ),
      );
    } else {
      print('SOMETHING BAD HAPPENED');
    }
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
      task: Task(
        title: _titleController.text,
        note: _noteController.text,
        isCompleted: 0,
        date: DateFormat.yMd().format(_selectedDate),
        startTime: _startTime,
        endTime: _endTime,
        color: _selectedColor,
        remind: _selectedRemind,
        repeat: _selectRepeat,
      ),
    );
    print('$value');
  }

  Column _colorPalette() {
    return Column(
      children: [
        Text(
          'Color',
          style: _textStyle,
        ),
        Wrap(
          children: List.generate(
            3,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: CircleAvatar(
                  child: _selectedColor == index
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 18,
                        )
                      : null,
                  backgroundColor: index == 0
                      ? const Color(0xFF0052BE)
                      : index == 1
                          ? const Color(0xFF8205FF)
                          : Color(0xFFB6740A),
                  radius: 14,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2054),
    );
    if (_pickedDate != null) {
      setState(() {
        _selectedDate = _pickedDate;
      });
    } else
      print('SOMETHING WRONG HAPPENED');
  }

  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? _pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
              DateTime.now().add(const Duration(minutes: 15))),
    );
    String _formattingTime = _pickedTime!.format(context);
    if (isStartTime) {
      setState(() {
        _startTime = _formattingTime;
      });
    } else if (!isStartTime) {
      setState(() {
        _endTime = _formattingTime;
      });
    } else {
      print('SOMETHING WRONG HAPPEND');
    }
  }
}
