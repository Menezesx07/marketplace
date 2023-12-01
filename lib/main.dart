import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marketplace/controller/home_controller.dart';
import 'package:marketplace/pages/splash_screen.dart';
import 'package:provider/provider.dart';

import 'controller/cart_controller.dart';

Future main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('cartBox');

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeController()),
          ChangeNotifierProvider(create: (context) => CartController())
        ],
        child: MyApp(),
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
