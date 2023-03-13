import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Example"),
      ),
      body: ElevatedButton(
        onPressed: () {
          Get.snackbar(
            'Get Data ',
            'Data Load completed',
            animationDuration: Duration(seconds: 0),
          );
          print("Button Click");
        },
        child: Text("SnakBar example"),
      ),
    );
  }
}
