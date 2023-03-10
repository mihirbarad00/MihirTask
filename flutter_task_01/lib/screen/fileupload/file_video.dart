import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_01/screen/fileupload/file_upload.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';

class FileVideo extends StatefulWidget {
  var filepath;
  FileVideo({super.key, required this.filepath});

  @override
  State<FileVideo> createState() => FileVideoState();
}

class FileVideoState extends State<FileVideo> {
  String dispath = 'please select item';
  VideoPlayerController? _controller;
  bool isshowImage = true;
  @override
  void initState() {
    print("<<<<<<<<<<<<${widget.filepath}<<<<<<>>>>>>>>>>>>>>>");
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.file(File('${widget.filepath}'));
    _controller!.addListener(() {
      setState(() {});
    });
    _controller!.dataSourceType;
    print("<<<<<<<<${_controller!.dataSourceType}>>>>>>");
    _controller!.setLooping(true);
    _controller!.initialize();
    _controller!.play();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Future<void> onwillpops() {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => file_upload(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Upload"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 420,
                maxWidth: double.infinity,
              ),
              child: VideoPlayer(
                _controller!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
