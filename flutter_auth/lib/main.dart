import 'package:flutter/material.dart';

import 'package:flutter_auth/ScreenS/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'FirebaseFireStore/homeUI.dart';
import 'ScreenS/homepage.dart';
import 'firebase_options.dart';

// ...

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
