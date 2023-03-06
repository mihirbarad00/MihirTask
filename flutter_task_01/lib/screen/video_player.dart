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

  bool? isPlay = true;

  List videolink = [];
  Future<void> initializeVideoPlayer(url) async {
    print("Function");
    videoPlayerController = VideoPlayerController.asset(url);

    await Future.wait([videoPlayerController!.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void initState() {
    super.initState();

    initializeVideoPlayer('assets/timers.mp4')
        .whenComplete(() => setState(() {}));
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 250,
              child: Center(
                child: chewieController != null &&
                        chewieController!
                            .videoPlayerController.value.isInitialized
                    ? Chewie(
                        controller: chewieController!,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text('Loading'),
                        ],
                      ),
              ),
            ),
          ],
        ));
  }
}
