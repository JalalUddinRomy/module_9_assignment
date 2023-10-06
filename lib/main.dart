import 'package:flutter/material.dart';
import 'package:module_9_assignment/HomeScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home:HomeScreen(),
   );

  }

}