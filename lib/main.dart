import 'package:flutter/material.dart';
import 'package:movie_task/ui/screens/details_screen/details_screen.dart';
import 'package:movie_task/ui/screens/home_screen/home_screen.dart';
import 'package:movie_task/ui/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //roots of my task app
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        DetailsScreen.routeName: (_) => const DetailsScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
