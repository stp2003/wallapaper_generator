import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallapaper_generator/screens/home_screen.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WallVortex Hub',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(16, 13, 34, 1),
      ),
      home: const HomePage(),
    );
  }
}
