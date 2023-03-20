import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({Key? key}) : super(key: key);

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

enum gender { male, female }

class _RadioButtonsState extends State<RadioButtons> {
  gender? _gender = gender.male;
  double _value = 0;
  bool switchValue = true;
  double ratingValue = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(">>>>frus>>>>>>${_gender}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Exmaple"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("male"),
            leading: Radio<gender>(
              value: gender.male,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                  print(">>>>frus>>>>>>${_gender}");
                });
              },
            ),
          ),
          ListTile(
            title: Text("famale"),
            leading: Radio<gender>(
              value: gender.female,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                  print(">>>>frus>>>>>>${_gender}");
                });
              },
            ),
          ),
          Slider(
            activeColor: _value <= 40
                ? Colors.green
                : _value >= 41 && _value <= 70
                    ? Colors.amber
                    : Colors.red,
            min: 0,
            max: 100,
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
              print("${_value.toInt()}");
            },
          ),
          Text(
            "${_value.toInt()}",
            style: TextStyle(
              fontSize: 40,
              color: _value <= 40
                  ? Colors.green
                  : _value >= 41 && _value <= 70
                      ? Colors.amber
                      : Colors.red,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                activeColor: Colors.green,
                inactiveThumbColor: Colors.red,
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = !switchValue;
                    switchValue == true ? log("On") : log("OFF");
                  });
                },
              ),
              Text(
                "Auto Download",
                style: TextStyle(
                    fontSize: 18,
                    color: switchValue == true ? Colors.green : Colors.red),
              ),
            ],
          ),
          RatingBar.builder(
            itemBuilder: (context, index) {
              return Icon(Icons.star);
            },
            allowHalfRating: true,
            ignoreGestures: false,
            glow: false,
            maxRating: 4,
            minRating: 2,
            onRatingUpdate: (rating) {
              setState(() {
                ratingValue = rating;
              });
              log("${rating}");
            },
          )
        ],
      ),
    );
  }
}
