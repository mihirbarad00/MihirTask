import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videosa extends StatelessWidget {
  List? _controllerlink = [
    VideoPlayerController.network(
        'https://filesamples.com/samples/video/mp4/sample_640x360.mp4'),
    VideoPlayerController.asset('assets/timers.mp4'),
    VideoPlayerController.network(
        'https://filesamples.com/samples/video/mp4/sample_640x360.mp4'),
    VideoPlayerController.asset('assets/test1.mp4'),
    VideoPlayerController.network(
        'https://filesamples.com/samples/video/mp4/sample_640x360.mp4'),
    VideoPlayerController.asset('assets/testa.mp4'),
  ];

  CarouselController _nextvideo = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 156, 128, 23),
          title: Text("Videos gallery"),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _controllerlink!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print('button is preesd$index');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowVideos(
                            urls: _controllerlink![index],
                          ),
                        ));
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Video ${index + 1}",
                        textAlign: TextAlign.start,
                      )),
                );
              },
            )),
          ],
        ),
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
  var urls;
  ShowVideos({super.key, required this.urls});

  @override
  State<ShowVideos> createState() => _ShowVideosState();
}

class _ShowVideosState extends State<ShowVideos> {
  VideoPlayerController? _controller;

  bool playVideo = false;
  @override
  void initState() {
    super.initState();

    _controller = widget.urls;

    _controller!.addListener(() {
      setState(() {});
    });
    _controller!.dataSourceType;
    print("<<<<<<<<${_controller!.dataSourceType}>>>>>>");
    _controller!.setLooping(true);
    _controller!.initialize();
    if (playVideo == false) {
      _controller!.pause();
    } else {
      _controller!.play();
    }
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
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 420,
              maxWidth: double.infinity,
            ),
            child: VideoPlayer(
              _controller!,
            ),
          ),
          VideoProgressIndicator(
            _controller!,
            allowScrubbing: true,
          ),
          TextButton(
              onPressed: () {
                playVideo == false ? _controller!.play() : _controller!.pause();

                setState(() {
                  playVideo = !playVideo;
                });

                print('-----------------button cllik');
              },
              child: Icon(
                playVideo == false ? Icons.play_arrow : Icons.pause,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
