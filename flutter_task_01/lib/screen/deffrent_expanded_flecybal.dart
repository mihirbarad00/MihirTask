import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class expaedExample extends StatefulWidget {
  const expaedExample({super.key});

  @override
  State<expaedExample> createState() => _expaedExampleState();
}

class _expaedExampleState extends State<expaedExample> {
// File file = File('/Users/admin/Downloads/abcd.jpg');
  Int8List? _showimage;
  void getimage(ImageUrl) async {
    final ByteData data =
        await NetworkAssetBundle(Uri.parse(ImageUrl)).load(ImageUrl);
    setState(() {
      _showimage = data.buffer.asInt8List();
      print(_showimage);
    });
  }

  @override
  void initState() {
    getimage(
        'https://img.freepik.com/free-photo/cool-geometric-triangular-figure-neon-laser-light-great-backgrounds-wallpapers_181624-9331.jpg');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/pizz.jpg',
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(
              'https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__480.jpg'),
          SizedBox(
            height: 20,
          ),
          Center(
              child: _showimage == null
                  ? const CircularProgressIndicator()
                  : Image.memory(
                      Uint8List.fromList(_showimage!),
                      width: 450,
                      height: 250,
                      fit: BoxFit.contain,
                    )),
        ],
      ),
    );
  }
}
