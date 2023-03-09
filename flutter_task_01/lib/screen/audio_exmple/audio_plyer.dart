import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class audio_player extends StatefulWidget {
  const audio_player({super.key});

  @override
  State<audio_player> createState() => audio_playerState();
}

class audio_playerState extends State<audio_player> {
  AudioPlayer player = AudioPlayer();
  bool isPlayAudio = false;
  String? dispath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio book"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    PlatformFile file = result.files.last;

                    setState(() {
                      dispath = file.path!;
                    });

                    print("$dispath???????????????????????????");
                  } else {
                    return;
                  }
                },
                child: Text("Audio ")),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isPlayAudio = !isPlayAudio;
                });
                isPlayAudio == true
                    ? player.pause()
                    : player.play(DeviceFileSource(dispath!));
              },
              icon: Icon(
                isPlayAudio == false ? Icons.pause : Icons.play_arrow,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
