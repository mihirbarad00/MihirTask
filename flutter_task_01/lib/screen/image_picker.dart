import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class image_picker extends StatefulWidget {
  const image_picker({super.key});

  @override
  State<image_picker> createState() => image_pickerState();
}

class image_pickerState extends State<image_picker> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(onPressed: () {}, child: Text('Click')),
    );
  }
}
