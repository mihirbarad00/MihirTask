import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import 'nfcTest.dart';

class readdata extends StatefulWidget {
  const readdata({super.key});

  @override
  State<readdata> createState() => _readdataState();
}

class _readdataState extends State<readdata> {
  String? datashow = 'please scan';
  @override
  void initState() {
    super.initState();

    NfcManager.instance.startSession(onDiscovered: (tag) async {
      Ndef? ndef = Ndef.from(tag);
      print("Data starts");

      try {
        if (ndef?.cachedMessage != null) {
          print("Data Load is done");
          var ndefMessage = ndef?.cachedMessage!;
          if (ndefMessage!.records.isNotEmpty &&
              ndefMessage.records.first.typeNameFormat ==
                  NdefTypeNameFormat.nfcWellknown) {
            final wellKnownRecord = ndefMessage.records.first;

            if (wellKnownRecord.payload.first == 0x02) {
              final languageCodeAndContentBytes =
                  wellKnownRecord.payload.skip(1).toList();
              final languageCodeAndContentText =
                  utf8.decode(languageCodeAndContentBytes);
              final payload = languageCodeAndContentText;
              final storedCounters = int.tryParse(payload);
              print("storedCounters >>>.${storedCounters}!");
              print("paylad${payload}!");
              print(
                  "languageCodeAndContentText>>>${languageCodeAndContentText}!");
              var url = 'https://www.$payload';
              //  var url = 'sms:+91$payload?body=hello%20there';

              print("pd${url}!");
              payload != null
                  ? await launch(
                      url,
                      universalLinksOnly: true,
                    )
                  : null;

              setState(() {
                datashow = payload;
              });

              if (storedCounters != null) {
                print("Success!");
                print('Counter restored from tag');
              }
            }
          }
        }
        print("Data Load is don111e");
        if (Platform.isIOS) {
          NfcManager.instance.stopSession();
        }
      } catch (e) {
        print("Tag isn't valid");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("${datashow}")));
  }
}
