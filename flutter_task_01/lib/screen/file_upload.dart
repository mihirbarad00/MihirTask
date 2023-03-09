import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'file_video.dart';

class file_upload extends StatefulWidget {
  const file_upload({super.key});

  @override
  State<file_upload> createState() => file_uploadState();
}

class file_uploadState extends State<file_upload> {
  String? dispath;
  bool isshowImage = true;
  var datatypes;
  bool isshowvideo = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 202, 154, 11)),
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      PlatformFile file = result.files.last;

                      print(file.name);
                      print(file.bytes);
                      print(file.size);
                      print(file.extension);
                      print(file.path);
                      print("$dispath");

                      setState(() {
                        dispath = file.path!;
                        print(
                            "--------123--------------------${dispath.runtimeType}");
                        datatypes = dispath!.substring(dispath!.length - 4);
                        print("-------456---------------${datatypes}");

                        isshowImage = false;
                        isshowvideo = true;
                      });

                      print("$dispath???????????????????????????");
                    } else {
                      setState(() {
                        dispath = 'please select item';
                        isshowImage = true;
                      });
                      Fluttertoast.showToast(
                          msg: "unselected item",
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Color.fromARGB(255, 235, 219, 218),
                          textColor: Color.fromARGB(255, 12, 12, 12),
                          fontSize: 16.0);
                    }
                  },
                  child: Text("Upload")),
            ),
            SizedBox(
              height: 10,
            ),
            Text("\' ${dispath ?? 'Select Item'} '"),
            datatypes == '.mp4'
                ? Visibility(
                    visible: isshowvideo,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FileVideo(
                                        filepath: dispath,
                                      )));
                        },
                        child: Text("View Media")),
                  )
                : dispath == null
                    ? Container()
                    : Image.file(File("$dispath")),
          ],
        ),
      ),
    );
  }
}
