import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_spotify/theme/colors.dart';

class SongPage extends StatefulWidget {
  final ImageProvider image;
  final String songlabel;
  final String singer;
  final String? lyrics;

  const SongPage({
    Key? key,
    required this.image,
    required this.songlabel,
    required this.singer, this.lyrics //required this.lyrics,
  }) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool status = false;
  
  final audioPlayer = AudioPlayer();
  //double _currentSliderValue = 20;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    //Listen states: playing,stop...
    audioPlayer.onPlayerStateChanged.listen((State) {
      setState(() {
        isPlaying = State == PlayerState.playing;
      });
    });

    //audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async{
    //repeat song
    audioPlayer.setReleaseMode(ReleaseMode.loop);

    final player = AudioCache(prefix: 'assets/songs/');
    final url = await player.load('Shay-Nanggg.mp3');
    audioPlayer.setSourceUrl(url.path);

  }

  @override
  void dispose() {
    super.dispose();
  }

  String formatTime(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return[
      if(duration.inHours > 0) hours,
      minutes,
      seconds
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        actions: const [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: white,
              ),
              onPressed: null)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 30, top: 10),
                  child: Container(
                    width: 310,
                    height: 270,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: grey,
                          blurRadius: 50,
                          spreadRadius: 5,
                          offset: const Offset(-10, 40))
                    ], borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                  child: Container(
                    width: 330,
                    height: 330,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: widget.image, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: 355,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.songlabel,
                          style: const TextStyle(
                              fontSize: 20,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.singer,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16, color: white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: (){
                        setState(() {
                          status = !status;
                        });
                      },
                      icon: status == true ? Icon(Icons.favorite, color: red) : Icon(Icons.favorite, color: grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Slider(
              activeColor: primary,
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);

                //if was paused
                await audioPlayer.resume();
              }),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatTime(position),
                    style: TextStyle(fontSize: 15,color: white.withOpacity(0.5)),
                  ),
                  Text(
                    formatTime(duration - position),
                    style: TextStyle(fontSize: 15,color: white.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shuffle,
                      color: white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      color: white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: Container(
                      decoration:
                        BoxDecoration(shape: BoxShape.circle, color: primary),
                      child: Center(
                        child: Icon(
                          isPlaying
                              ? Icons.stop
                              : Icons.play_arrow,
                          size: 28,
                          color: white,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.resume();
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      color: white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.repeat,
                      color: white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.tv,
                  color: primary,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    "Chromecast is ready",
                    style: TextStyle(color: primary, fontSize: 15),
                  ),
                )
              ],
            ),
            const SizedBox(height: 25),
            Container(
              color: blackBG,
              width: 400,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lyrics",
                      style: const TextStyle(
                          fontSize: 20,
                          color: white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Mỗi lúc sớm mai Em hay thường pha tách trà Và nghe mùi hương của gió bay qua..",
                      style: TextStyle(
                          fontSize: 16, color: white.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
            ),
           ],
         ),
      ),
    );
  }
}
