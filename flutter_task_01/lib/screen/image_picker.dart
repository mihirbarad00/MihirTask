import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyImagePicker extends StatefulWidget {
  const MyImagePicker({super.key});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File? image;
  bool? isShowbutton = true;
  bool ischangebutton = false;

  void pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      isShowbutton = false;
      ischangebutton = true;
    }

    final imageTemp = File(image.path);

    setState(() => this.image = imageTemp);
  }

  void pickImageC() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    isShowbutton = false;
    if (image == null) {
      return;
    } else {
      isShowbutton = false;
      ischangebutton = true;
    }

    final imageTemp = File(image.path);

    setState(() => this.image = imageTemp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isShowbutton == true
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 114, 104, 18)),
                      onPressed: () {
                        boottomsheets(context);
                      },
                      child: Text("Open Image"))
                  : image != null
                      ? Image.file(image!)
                      : Text("No image"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: image != null
                    ? Visibility(
                        visible: ischangebutton,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                boottomsheets(context);
                                isShowbutton = true;
                                ischangebutton = false;
                              });
                            },
                            child: Text("Change it")),
                      )
                    : Container(),
              )
            ],
          ),
        ));
  }

  void boottomsheets(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: [
              ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Gallary'),
                  onTap: () {
                    pickImage();
                    Navigator.pop(context);
                  }),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camara'),
                onTap: () {
                  pickImageC();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
