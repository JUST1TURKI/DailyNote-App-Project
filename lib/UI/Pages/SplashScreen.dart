import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart' as color;
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/splash.png',
      ),
      logoWidth: 100,
      gradientBackground: LinearGradient(
        colors: [
          color.AppColor.gradientFirst,
          color.AppColor.gradientFirst.withOpacity(0.8),
          color.AppColor.gradientSecond,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      showLoader: false,
      loadingText: const Text(
        "",
        style: TextStyle(fontSize: 22, fontFamily: ''),
      ),
      navigator: const HomePage(),
      durationInSeconds: 4,
    );
  }
}
