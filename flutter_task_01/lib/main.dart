import 'package:flutter/material.dart';
import 'package:flutter_task_01/screen/file_video.dart';
import 'package:sizer/sizer.dart';

import 'screen/file_upload.dart';
import 'screen/video_exmpale.dart';
import 'screen/video_player.dart';

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
            theme: ThemeData(useMaterial3: false, primaryColor: Colors.amber),
            debugShowCheckedModeBanner: false,
            home: file_upload());
      },
    );
  }
}
