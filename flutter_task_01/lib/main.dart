import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_01/pageviewExmple.dart';

import 'screen/audio_exmple/audio_play_list.dart';
import 'screen/audio_exmple/audio_plyer.dart';
import 'screen/video_exmpale.dart';

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
        home: videosa());
  }
}
