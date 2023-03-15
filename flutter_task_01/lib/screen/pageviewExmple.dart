import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_task_01/screen/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';

class pageviewExample extends StatefulWidget {
  List<Model>? mydata = [];
  int? index;

  pageviewExample({super.key, required this.index, this.mydata});

  @override
  State<pageviewExample> createState() => _pageviewExampleState();
}

class _pageviewExampleState extends State<pageviewExample> {
  int selectedIndex = 0;
  VideoPlayerController? _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool playVideo = true;

  List<String?>? fetchdatalist;

  @override
  void initState() {
    print("Versin 1.1.");
    selectedIndex = widget.index!;
    _controller =
        VideoPlayerController.network(widget.mydata![selectedIndex].fileName!)
          ..play()
          ..setLooping(true);
    _initializeVideoPlayerFuture = _controller!.initialize();
    _controller!.addListener(() {
      if (_controller!.value.hasError) {
        print(
            'Video player encountered an error: ${_controller!.value.errorDescription}');
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  PageController _pagecontroller = PageController(initialPage: 0);

  int _curruntPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        itemCount: widget.mydata!.length,
        controller: _pagecontroller,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _controller!.value.isInitialized &&
                  !_controller!.value.hasError
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: Colors.amber,
                ));
          // ConstrainedBox(
          //   constraints: const BoxConstraints(
          //     maxHeight: 380,
          //     maxWidth: double.infinity,
          //   ),
          //   child: VideoPlayer(
          //     _controller!,
          //   ),
          // ),
        },
        onPageChanged: (value) {
          _controller!.removeListener(() {
            satState() {}
          });
          if (value > _curruntPage) {
            selectedIndex++;
            print("Increament $selectedIndex");

            print("SetState on--- $_controller");

            _controller = VideoPlayerController.network(
                widget.mydata![selectedIndex].fileName!)
              ..initialize().whenComplete(() {
                _controller!.play();
                setState(() {
                  _controller;
                });
              });

            // _controller!.addListener(() {
            //   if (_controller!.value.hasError == true) {
            //     setState(() {
            //       _controller = VideoPlayerController.network(
            //           widget.mydata![selectedIndex].fileName!)
            //         ..initialize().whenComplete(() => setState(() {
            //               _controller!.play();
            //               _controller!;
            //             }));
            //     });
            //     Fluttertoast.showToast(
            //         msg: "could not load media",
            //         gravity: ToastGravity.BOTTOM,
            //         backgroundColor: Color.fromARGB(255, 255, 17, 0),
            //         textColor: Color.fromARGB(255, 231, 224, 224),
            //         fontSize: 15.0);
            //   }
            // });
            if (selectedIndex >= 9) {
              setState(() {
                selectedIndex = 0;
              });

              print("Increament over tha 10 $selectedIndex");
            } else if (selectedIndex <= 0) {
              setState(() {
                selectedIndex = 0;
              });
            }
          } else {
            selectedIndex--;
            print("decrement $selectedIndex");
            _controller = VideoPlayerController.network(
                widget.mydata![selectedIndex].fileName!);
            _controller?.initialize().whenComplete(() => setState(() {
                  _controller;
                }));
          }

          _curruntPage = value;
        },
      ),
    );
  }
}
