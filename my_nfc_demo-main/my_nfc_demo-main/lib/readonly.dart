import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

class readOny extends StatefulWidget {
  const readOny({super.key});

  @override
  State<readOny> createState() => _readOnyState();
}

class _readOnyState extends State<readOny> {
  var iconColor = Colors.blue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNfcReader.read().then((response) {
      print(">>>>readtext>>>>>${response.status}");
      print(">>>>readtext>>>>>${response.content}");
      print(">>>>readtext>>>>>${response.id}");
      print(">>>>readtext>>>>>${response.statusMapper}");
    });
    FlutterNfcReader.onTagDiscovered();
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
