import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/UI/widgets/button.dart';
import '../colors.dart' as color;
import 'addTaskPage.dart';

class Missions extends StatefulWidget {
  const Missions({Key? key}) : super(key: key);
  @override
  _Missions createState() => _Missions();
}

class _Missions extends State<Missions> {
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
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    const Text(
                      'Daily Missions',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: MyButton(
                        label: 'add Task',
                        onTap: () {
                          Get.to(const AddTaskPage());
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
