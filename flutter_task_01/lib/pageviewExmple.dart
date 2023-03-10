import 'package:flutter/material.dart';
import 'package:flutter_task_01/screen/model.dart';
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
  bool playVideo = true;

  List<String?>? fetchdatalist;

  @override
  void initState() {
    selectedIndex = widget.index!;
    _controller =
        VideoPlayerController.network(widget.mydata![selectedIndex].fileName!);
    _controller!.initialize();
    _controller!.pause();
    super.initState();
  }

  @override
  void dispose() {
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 280,
                  maxWidth: double.infinity,
                ),
                child: VideoPlayer(_controller!),
              ),
              VideoProgressIndicator(
                _controller!,
                allowScrubbing: true,
              ),
            ],
          );
        },
        onPageChanged: (value) {
          // _curruntPage = value;
          // print("_curruntPage:--- $_curruntPage");
          // print("value:--- $value");

          if (value > _curruntPage) {
            selectedIndex++;
            print("Increament $selectedIndex");
            _controller = VideoPlayerController.network(
                widget.mydata![selectedIndex].fileName!);
            _controller?.initialize().whenComplete(() => setState(() {
                  _controller;
                }));
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

          // print(selectedIndex);
          // print(value);

          // _controller = VideoPlayerController.network(
          //     widget.mydata![selectedIndex].fileName!);

          // setState(() {
          //   print("Check Is :$selectedIndex");

          //   selectedIndex = value;
          //   if (selectedIndex! >= 11) {
          //     selectedIndex = 0;
          //   }
          //   print("Check Is :$selectedIndex");
          // });
        },
      ),
    );
  }
}
