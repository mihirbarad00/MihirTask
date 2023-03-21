import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_nfc_demo/nfcTest.dart';
import 'package:nfc_manager/nfc_manager.dart';

class scanDevice extends StatefulWidget {
  const scanDevice({super.key});

  @override
  State<scanDevice> createState() => _scanDeviceState();
}

class _scanDeviceState extends State<scanDevice> {
  TextEditingController _textController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        TextFormField(
                          controller: _textController,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              NfcManager.instance.startSession(
                                  onDiscovered: (tag) async {
                                Ndef? ndef = Ndef.from(tag);
                                print("WIte i Starrt${tag}");

                                NdefMessage message = NdefMessage([
                                  NdefRecord.createText(
                                      _textController.text.toString())
                                ]);
                                print("Message:------${message}");

                                try {
                                  await ndef!.write(message);
                                  NfcManager.instance.stopSession();
                                  print("Counter witten a tag");
                                  // _alert('Counter written to tag');

                                  return;
                                } catch (e) {
                                  print('error $e');
                                  return;
                                }
                              });
                            },
                            child: Text("OK "))
                      ],
                    );
                  },
                );
                print("Buttoncheck");
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Text(
                  "Add Text",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        TextFormField(
                          controller: _urlController,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              NfcManager.instance.startSession(
                                  onDiscovered: (tag) async {
                                Ndef? ndef = Ndef.from(tag);
                                print("WIte i Starrt${tag}");
                                var url =
                                    Uri.parse(_urlController.text.toString());

                                NdefMessage message =
                                    NdefMessage([NdefRecord.createUri(url)]);
                                print("Message:------${message}");

                                try {
                                  await ndef!.write(message);
                                  NfcManager.instance.stopSession();
                                  print("Counter witten a tag");

                                  return;
                                } catch (e) {
                                  print('error $e');
                                  return;
                                }
                              });
                            },
                            child: Text("OK "))
                      ],
                    );
                  },
                );
                print("Buttoncheck2");
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.amber),
                child: Text(
                  "Add Link",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
