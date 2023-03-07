import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

List<String> videos = [
  'https://filesamples.com/samples/video/mp4/sample_640x360.mp4',
  'assets/timers.mp4',
  'https://filesamples.com/samples/video/mp4/sample_640x360.mp4',
  'assets/testa.mp4',
  'https://filesamples.com/samples/video/mp4/sample_640x360.mp4',
  'assets/test1.mp4',
];

class videosa extends StatelessWidget {
  CarouselController _nextvideo = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Video Player'),
        ),
        body: Column(
          children: [
            Text("Videos gallery"),
            Expanded(
                child: ListView.builder(
              physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,

                  // padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      print('button is preesd$index');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowVideos(
                              urls: videos[index],
                            ),
                          ));
                    },
                    child: Container(
                        decoration: BoxDecoration(color: Colors.amberAccent),
                        child: Text("Video ${index + 1}")),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerRemote extends StatefulWidget {
  final String? url;
  VideoPlayerRemote({this.url});
  @override
  _VideoPlayerRemoteState createState() => _VideoPlayerRemoteState();
}

class _VideoPlayerRemoteState extends State<VideoPlayerRemote> {
  VideoPlayerController? _controller;
  bool onstart = true;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.url!);

    _controller!.addListener(() {
      setState(() {});
    });
    _controller!.setLooping(true);
    _controller!.initialize();
    onstart ? _controller!.play() : _controller!.pause();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(padding: const EdgeInsets.only(top: 20.0)),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller!),
                  VideoProgressIndicator(_controller!, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShowVideos extends StatefulWidget {
  final String urls;
  ShowVideos({super.key, required this.urls});

  @override
  State<ShowVideos> createState() => _ShowVideosState();
}

class _ShowVideosState extends State<ShowVideos> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.urls);

    _controller!.addListener(() {
      setState(() {});
    });
    _controller!.setLooping(true);
    _controller!.initialize();
    _controller!.play();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: VideoPlayerRemote(
          url: widget.urls,
        ),
      ),
    );
  }
}
