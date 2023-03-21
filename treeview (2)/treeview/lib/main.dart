import 'package:flutter/material.dart';

import 'package:treeview/design.dart';

import 'designs.dart';
import 'mytry/apitreeview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: apiTreeView());
  }
}
