import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player_app/services/notification_services.dart';
import 'UI/Pages/SplashScreen.dart';
import 'UI/Pages/addTaskPage.dart';
import 'UI/Pages/home_page.dart';
import 'UI/Pages/notification_screen.dart';
import 'UI/Pages/try.dart';
import 'UI/widgets/button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized;
  // NotifyHelper notifyHelper = NotifyHelper();
  // await notifyHelper.initializeNotification();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily Note',
        theme: ThemeData(fontFamily: 'Kanit'),
        home: HomePage()
        //  NotificationScreen(
        //   payload: 'Title|Description|Date',
        // ),
        );
  }
}
