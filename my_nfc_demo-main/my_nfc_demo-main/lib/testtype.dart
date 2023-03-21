import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

class NfcReaderPage extends StatefulWidget {
  @override
  _NfcReaderPageState createState() => _NfcReaderPageState();
}

class _NfcReaderPageState extends State<NfcReaderPage> {
  String _data = '';

  Future<void> _startNfcRead() async {
    try {
      NfcData data = await FlutterNfcReader.read();
      setState(() {
        _data = data.content;
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFC Reader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NFC Data:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              _data,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startNfcRead();
        },
        child: Icon(Icons.nfc),
      ),
    );
  }
}
