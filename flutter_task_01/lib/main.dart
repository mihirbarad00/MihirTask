import 'package:flutter/material.dart';
import 'package:flutter_task_01/authenticScreens/Homepage.dart';
import 'package:flutter_task_01/screen/future&Stream/FutureB.dart';
import 'package:flutter_task_01/screen/future&Stream/StreamBuilders.dart';

import 'package:flutter_task_01/screen/pageviewExmple.dart';
import 'package:flutter_task_01/screen/ApiExample/dio_exmaple.dart';
import 'package:flutter_task_01/screen/video_exmpale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
