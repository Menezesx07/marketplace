import 'package:flutter/material.dart';
import 'package:marketplace/controller/home_controller.dart';
import 'package:marketplace/pages/detail_screen.dart';
import 'package:marketplace/pages/splash_screen.dart';
import 'package:provider/provider.dart';

Future main() async {
  runApp(
      ChangeNotifierProvider(
        create: (context) => HomeController(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
