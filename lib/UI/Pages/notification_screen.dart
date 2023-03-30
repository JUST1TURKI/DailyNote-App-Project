import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../colors.dart' as color;
import 'package:rive/rive.dart';
import 'package:flutter/src/painting/gradient.dart' as flutter;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);

  final String payload;
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';
  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: flutter.LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(0.9),
              color.AppColor.gradientSecond,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
          boxShadow: const [
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
                width: size.width,
                height: size.height * 0.15,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: color.AppColor.secondPageIconColor,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.edit_calendar_rounded,
                      size: 30,
                      color: color.AppColor.secondPageIconColor,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  Text(
                    'Hello, TURKI',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: color.AppColor.secondPageTitleColor,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                'You Have A New Reminder',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: color.AppColor.secondPageTitleColor,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(7, 10),
                      blurRadius: 15,
                      color: Colors.black,
                    ),
                  ],
                  image: const DecorationImage(
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/notifiction.png'),
                  ),
                ),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(Icons.title, size: 30),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Title',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _payload.toString().split('|')[0],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.description, size: 30),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _payload.toString().split('|')[1],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.calendar_today_outlined, size: 30),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Date',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _payload.toString().split('|')[2],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
