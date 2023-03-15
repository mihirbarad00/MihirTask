import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

import 'pageviewExmple.dart';
import 'model.dart';

Future<List<Model>> getData() async {
  final response = await http.get(Uri.parse(
      'https://recursing-gauss.103-175-163-209.plesk.page/api/Status_app/hanuman_video'));
  // var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    List jsonResponce = jsonDecode(response.body);
    return jsonResponce.map((data) => new Model.fromJson(data)).toList();
  } else {
    throw Exception('server not found');
  }
}

class videosa extends StatefulWidget {
  @override
  State<videosa> createState() => _videosaState();
}

class _videosaState extends State<videosa> {
  // List? _controllerlink = [

  CarouselController _nextvideo = CarouselController();
  late Future<List<Model>> fetchlist;

  @override
  void initState() {
    super.initState();
    fetchlist = getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 70, 62, 25),
                  Color.fromARGB(255, 143, 121, 22)
                ]),
          ),
        ),
        title: Text("Videos gallery"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Model>>(
              future: fetchlist,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Model> mydata = snapshot.data!;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: mydata.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => pageviewExample(
                                    index: index, mydata: mydata),
                              ));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${mydata[index].fileThumb}',
                                    scale: 0.1),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    },
                  );
                  // return ListView.builder(
                  //   physics: ScrollPhysics(
                  //       parent: AlwaysScrollableScrollPhysics()),
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   itemCount: mydata.length,
                  //   itemBuilder: (context, index) {
                  //     return Container(
                  //       margin: EdgeInsets.all(10),
                  //       child: Row(
                  //         children: [
                  //           Image.network(
                  //             '${mydata[index].fileThumb}',
                  //             scale: 2.0,
                  //             height: 200,
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(
                  //                 bottom: 100, left: 50),
                  //             child: Column(
                  //               children: [
                  //                 Text(
                  //                   "Status no: ${index + 1}",
                  //                   style: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.w600,
                  //                     color:
                  //                         Color.fromARGB(255, 173, 108, 10),
                  //                   ),
                  //                 ),
                  //                 TextButton(
                  //                     onPressed: () {
                  //                       Navigator.push(
                  //                           context,
                  //                           MaterialPageRoute(
                  //                               builder: (context) => ShowVideos(
                  //                                   urls: VideoPlayerController
                  //                                       .network(mydata[index]
                  //                                           .fileName
                  //                                           .toString()))));
                  //                     },
                  //                     child: Text("View Status")),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // );
                } else if (snapshot.hasError) {}
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class VideoPlayerRemote extends StatefulWidget {
//   final String? url;
//   VideoPlayerRemote({this.url});
//   @override
//   _VideoPlayerRemoteState createState() => _VideoPlayerRemoteState();
// }

// class _VideoPlayerRemoteState extends State<VideoPlayerRemote> {
//   VideoPlayerController? _controller;
//   bool onstart = true;

//   @override
//   void initState() {
//     super.initState();

//     _controller = VideoPlayerController.network(widget.url!);

//     _controller!.addListener(() {
//       setState(() {});
//     });
//     _controller!.setLooping(true);
//     _controller!.initialize();
//     onstart ? _controller!.play() : _controller!.pause();
//   }

//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(padding: const EdgeInsets.only(top: 20.0)),
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: AspectRatio(
//               aspectRatio: _controller!.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   VideoPlayer(
//                     _controller!,
//                   ),
//                   VideoProgressIndicator(_controller!, allowScrubbing: true),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ShowVideos extends StatefulWidget {
  List<Model>? mydata = [];
  int? index;

  ShowVideos({super.key, this.mydata, required this.index});

  @override
  State<ShowVideos> createState() => _ShowVideosState();
}

class _ShowVideosState extends State<ShowVideos> {
  VideoPlayerController? _controller;
  bool playVideo = true;

  List<String?>? fetchdatalist;

  @override
  void initState() {
    print("---widget index---->${widget.index}");
    print("---widget lengh---->${widget.mydata!.length}");
    // print(">Fetch List of index>>>>${widget.mydata![num].fileName}");

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 121, 93, 12),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.mydata!.length,
          itemBuilder: (context, index) {
            _controller =
                VideoPlayerController.network(widget.mydata![index].fileName!);
            print("checkitem_${widget.mydata![index].fileName!}");
            print("----1c------${num}");
            _controller!.initialize();
            _controller!.pause();
            return Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 280,
                  ),
                  child: VideoPlayer(_controller!),
                ),
                GestureDetector(
                  onTap: () {},
                  child: VideoProgressIndicator(
                    _controller!,
                    allowScrubbing: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // TextButton(
                //     onPressed: () {
                //       playVideo == false
                //           ? _controller!.play()
                //           : _controller!.pause();

                //       setState(() {
                //         playVideo = !playVideo;
                //       });

                //       print('-----------------button cllik');
                //     },
                //     child: Icon(
                //       playVideo == false ? Icons.play_arrow : Icons.pause,
                //       color: Colors.black,
                //     )),
              ],
            );
          },
        ));
  }
}
