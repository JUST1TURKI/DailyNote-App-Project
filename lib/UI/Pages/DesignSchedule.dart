import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import '../colors.dart' as color;
import 'package:get/get.dart';

class DesignSchedule extends StatefulWidget {
  const DesignSchedule({Key? key}) : super(key: key);
  @override
  _DesignScheduleState createState() => _DesignScheduleState();
}

class _DesignScheduleState extends State<DesignSchedule> {
  @override
  Widget build(BuildContext context) {
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
                height: 120,
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
                    'Design your',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: color.AppColor.secondPageTitleColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, top: 5),
              child: Text(
                'own Schedule',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: color.AppColor.secondPageTitleColor,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
