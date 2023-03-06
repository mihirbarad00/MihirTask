import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
            theme: ThemeData(useMaterial3: false),
            debugShowCheckedModeBanner: false,
            home: Video_Player());
      },
    );
  }
}
