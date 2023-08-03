import 'package:flutter/material.dart';
import 'package:todo_app/first-screen.dart';


void main() {
  runApp( MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.grey
    ),
    home:const FirstScreen(
    ) ),
  );
}
