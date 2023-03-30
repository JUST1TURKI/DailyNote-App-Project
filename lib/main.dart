import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'UI/Pages/SplashScreen.dart';
import 'UI/Pages/notification_screen.dart';
import 'UI/Pages/try.dart';
import 'UI/widgets/button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily Note',
        theme: ThemeData(fontFamily: 'Kanit'),
        home: TryScreen()
        //  NotificationScreen(
        //   payload: 'Title|Description|Date',
        // ),
        );
  }
}
