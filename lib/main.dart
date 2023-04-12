import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player_app/db/db_helper.dart';
import 'package:video_player_app/services/notification_services.dart';
import 'UI/Pages/SplashScreen.dart';
import 'UI/Pages/addTaskPage.dart';
import 'UI/Pages/home_page.dart';
import 'UI/Pages/notification_screen.dart';
import 'UI/widgets/button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  WidgetsFlutterBinding.ensureInitialized();
  // NotifyHelper notifyHelper = NotifyHelper();
  // await notifyHelper.initializeNotification();
  await DBHelper.initDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily Note',
        theme: ThemeData(fontFamily: 'Kanit'),
        home: const SplashPage()
        //  NotificationScreen(
        //   payload: 'Title|Description|Date',
        // ),
        );
  }
}
