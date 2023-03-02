import 'package:flutter/material.dart';
import 'package:flutter_task_01/screen/image_picker.dart';

import 'package:sizer/sizer.dart';

import 'screen/LoginScreen.dart';
import 'screen/datePicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            theme: ThemeData(primaryColor: Colors.black),
            debugShowCheckedModeBanner: false,
            home: image_picker());
      },
    );
  }
}
