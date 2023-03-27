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
        'assets/Splash.png',
      ),
      logoWidth: 100,
      gradientBackground: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF072142),
          Color(0xFF0C2A5A),
          Color(0xFF0F346F),
          Color(0xFF0C3B7B),
          Color(0xFF07407F),
          Color(0xFF004382),
        ],
        stops: [
          0.0,
          0.1,
          0.25,
          0.5,
          0.75,
          1.0,
        ],
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
