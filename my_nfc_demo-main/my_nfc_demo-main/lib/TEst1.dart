// import 'package:flutter/material.dart';
// import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
// import 'package:my_nfc_demo/readonly.dart';
// import 'package:my_nfc_demo/writeonly.dart';

// class test1 extends StatefulWidget {
//   @override
//   State<test1> createState() => _test1State();
// }

// class _test1State extends State<test1> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController writerController = TextEditingController();
//     writerController.text = "text here";
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Material App Bar'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             TextField(
//               controller: writerController,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => readOny(),
//                     ));
//               },
//               child: Text("Read"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => writeonly(
//                         urls: writerController.text.toString(),
//                       ),
//                     ));
//               },
//               child: Text("Write"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
