import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_rev/pages/homepage.dart';
import 'package:todoapp_rev/pages/profilepage.dart';

void main() async{

  // Initialize Hive
  await Hive.initFlutter();

  // open box
  var box = await Hive.openBox("myBox");

  // Run App
  runApp(const RToDoApp());
}

class RToDoApp extends StatelessWidget {
  const RToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      initialRoute: '/home',
      routes: {
        '/home' : (context) => Home(),
        '/profile' : (context) => ProfilePage(),
      }
    );
  }
}
