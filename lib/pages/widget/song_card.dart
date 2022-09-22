import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_spotify/pages/screen/song_page.dart';
import '../../json/songs_json.dart';
import '../../theme/colors.dart';

class SongCard extends StatelessWidget {
  final ImageProvider image;
  final String songlabel;
  final String singer;

  const SongCard(
      {Key? key,
      required this.image,
      required this.songlabel,
      required this.singer,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => SongPage(
                  image: image,
                  singer: singer,
                  songlabel: songlabel,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 27),
        child: Container(
          width: (size.width - 10) * 0.92,
          decoration: BoxDecoration(
            color: blackBG,
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Image(
                image: image,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    songlabel,
                    style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(height: 3),
                  Text(
                    singer,
                    style: const TextStyle(color: grey, fontSize: 15),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: (size.width - 60) * 0.11,
                height: 50,
                color: blackBG,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: grey.withOpacity(0.8),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.play_arrow,
                        color: white,
                        size: 16,
                      )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
