import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Video_Player extends StatefulWidget {
  const Video_Player({super.key});

  @override
  State<Video_Player> createState() => _Video_PlayerState();
}

class _Video_PlayerState extends State<Video_Player> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  var videolist;

  bool? isPlay = true;

  List videolink = [
    'assets/timers.mp4',
    'assets/test1.mp4',
    'assets/testa.mp4',
    'assets/test.mp4',
  ];
  // Future<void> initializeVideoPlayer() async {
  //   print("Function");

  //   // videoPlayerController = VideoPlayerController.asset(arl.toString());

  //   // await Future.wait([videoPlayerController!.initialize()]);
  //   chewieController = ChewieController(
  //     videoPlayerController: videoPlayerController!,
  //     autoPlay: true,
  //     looping: true,
  //   );
  // }

  @override
  void initState() {
    super.initState();

    // initializeVideoPlayer().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: videolink.length,
                itemBuilder: (context, index) {
                  VideoPlayerController controller =
                      VideoPlayerController.asset(videolink[index])
                        ..initialize().then((_) {
                          print("!)00000>Initialize complted");
                        });

                  controller.play();

                  print(">>><><${videolink[index]}");
                  return Container(
                    width: double.infinity,
                    height: 200,
                    child: VideoPlayer(controller),
                  );
                },
              ),
            )
          ],
        ));
  }
}
