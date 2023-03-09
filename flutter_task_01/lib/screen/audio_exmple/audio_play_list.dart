import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class audio_list extends StatefulWidget {
  const audio_list({super.key});

  @override
  State<audio_list> createState() => _audio_listState();
}

class _audio_listState extends State<audio_list> {
  AudioPlayer player = AudioPlayer();
  bool isPlayAudio = false;
  List audiobook = [
    'audio1.mp3',
    'audio2.mp3',
    'audio3.mp3',
    'audio2.mp3',
  ];
  List<bool> isPlayAudi = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 88, 59, 48),
        centerTitle: true,
        title: Text("Audio List "),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: audiobook.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 209, 185, 176),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Audio is ${index + 1}"),
                    ),
                    IconButton(
                      onPressed: () async {
                        print('isplaying${isPlayAudi[index]}');

                        setState(() {
                          for (int i = 0; i < isPlayAudi.length; i++) {
                            if (i != index) {
                              isPlayAudi[i] = false;
                            }
                          }
                          isPlayAudi[index] = !isPlayAudi[index];
                        });

                        isPlayAudi[index] == true
                            ? player.play(AssetSource(audiobook[index]))
                            : player.pause();
                      },
                      icon: Icon(
                        isPlayAudi[index] == false
                            ? Icons.play_arrow
                            : Icons.pause,
                        size: 30,
                      ),
                    ),
                  ],
                )),
              );
            },
          )),
        ],
      ),
    );
  }
}

class audiosplayers extends StatefulWidget {
  var url;
  audiosplayers({super.key, @required this.url});

  @override
  State<audiosplayers> createState() => _audiosplayersState();
}

class _audiosplayersState extends State<audiosplayers> {
  AudioPlayer player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.play(AssetSource(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.all(10),
          //    decoration: BoxDecoration(color: Colors.amber),
          child: Center(
              child: Row(
            children: [
              IconButton(
                onPressed: () async {
                  setState(() {
                    player.pause();
                  });
                },
                icon: Icon(
                  Icons.pause,
                  size: 30,
                ),
              ),
            ],
          )),
        ));
  }
}
