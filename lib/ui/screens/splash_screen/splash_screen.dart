import 'package:flutter/material.dart';
import 'package:movie_task/ui/screens/home_screen/home_screen.dart';
import 'package:movie_task/ui/utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Image.asset(
          AppAssets.icSplash,
          fit: BoxFit.fill,
          height: height * .15,
          width: width * .30,
        ),
      ),
    );
  }
}
