import 'package:flutter/material.dart';

class valuesa extends StatefulWidget {
  const valuesa({super.key});

  @override
  State<valuesa> createState() => _valuesaState();
}

class _valuesaState extends State<valuesa> {
  ValueNotifier<int> objValue = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: objValue,
            builder: (context, value, child) {
              return Text(objValue.value.toString());
            },
          ),
          ElevatedButton(
              onPressed: () {
                objValue.value += 1;
              },
              child: Text("Chenge")),
        ],
      ),
    );
  }
}
