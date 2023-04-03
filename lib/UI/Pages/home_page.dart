import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/notification_services.dart';
import 'DesignSchedule.dart';
import '../colors.dart' as color;
import 'mission.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotifyHelper notifyHelper;
  @override
  void initState() {
    super.initState();

    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSpermission();
    notifyHelper.initializeNotification();

    _initData();
  }

  List info = [];
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString('json/info.json')
        .then((value) => info = json.decode(value));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Jotter',
                      style: TextStyle(
                        fontSize: 30,
                        color: color.AppColor.homePageTitle,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.account_circle,
                      size: 40,
                      color: color.AppColor.gradientFirst,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                _ChatBot(),
                const SizedBox(
                  height: 20,
                ),
                _Timer(context),
                const SizedBox(
                  height: 5,
                ),
                _DesignSchedule(context),
                Row(
                  children: [
                    Text(
                      'My Notes',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: color.AppColor.homePageTitle),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                _MyNote(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.white.withOpacity(0),
            context: context,
            builder: (context) {
              return Container(
                width: size.width,
                height: size.height,
                color: Colors.white.withOpacity(0),
                child: const Missions(),
              );
            },
          );
        },
        backgroundColor: const Color(0xff0f17ad),
        child: const Icon(
          Icons.add_task,
          size: 30,
          color: Colors.white,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
      ),
    );
  }

// ! MY NOTE

  // ignore: non_constant_identifier_names
  Expanded _MyNote() {
    return Expanded(
      child: ListView.builder(
        itemCount: (info.length.toDouble() / 2).toInt(),
        itemBuilder: (_, i) {
          int a = 2 * i;
          int b = 2 * i + 1;
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: color.AppColor.homePageBackground,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      BoxShadow(
                        offset: Offset(-5, -5),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage(info[a]['img']),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        info[a]['title'],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: color.AppColor.homePageDetail),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: color.AppColor.homePageBackground,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      BoxShadow(
                        offset: Offset(-5, -5),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage(info[b]['img']),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        info[b]['title'],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: color.AppColor.homePageDetail),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

// ! Design Schedule

  // ignore: non_constant_identifier_names
  Container _DesignSchedule(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 35),
            width: MediaQuery.of(context).size.width,
            height: 90,
            decoration: BoxDecoration(
              color: color.AppColor.homePageBackground,
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 40,
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/card.png'),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, bottom: 2),
                  child: Text(
                    'Design Schedule',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: color.AppColor.homePageDetail,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => DesignSchedule());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 25,
                    color: color.AppColor.homePageIcons,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              left: 150,
            ),
            decoration: BoxDecoration(
              color: color.AppColor.homePageBackground.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                alignment: Alignment.topRight,
                image: AssetImage('assets/Tasks.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

// ! ChatBot

  // ignore: non_constant_identifier_names
  Row _ChatBot() {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/chatbot.png'),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Chat Bot',
          style: TextStyle(
            fontSize: 20,
            color: color.AppColor.homePageSubtitle,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(child: Container()),
        Text(
          'Details',
          style: TextStyle(
            fontSize: 20,
            color: color.AppColor.homePageDetail,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.arrow_forward,
          size: 20,
          color: color.AppColor.homePageIcons,
        ),
      ],
    );
  }

// ! Timer

  // ignore: non_constant_identifier_names
  Container _Timer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.AppColor.gradientFirst,
            color.AppColor.gradientFirst.withOpacity(0.8),
            color.AppColor.gradientSecond,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(80),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(7, 10),
            blurRadius: 15,
            color: color.AppColor.gradientSecond,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Clock Timer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: color.AppColor.homePageContainerTextSmall,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Startup & Boost your Productivity  ',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: color.AppColor.homePageContainerTextSmall,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.local_fire_department_rounded,
                  size: 30,
                  color: color.AppColor.fire,
                ),
                Icon(
                  Icons.local_fire_department_rounded,
                  size: 30,
                  color: color.AppColor.fire,
                ),
                Icon(
                  Icons.local_fire_department_rounded,
                  size: 30,
                  color: color.AppColor.fire,
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 20,
                      color: color.AppColor.homePageContainerTextSmall,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '45 min',
                      style: TextStyle(
                        fontSize: 15,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 10,
                            color: color.AppColor.gradientFirst)
                      ]),
                  child: Icon(
                    Icons.more_time_rounded,
                    color: Colors.white,
                    size: 55,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
