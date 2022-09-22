import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_spotify/pages/screen/album_page.dart';
import 'package:flutter_app_spotify/theme/colors.dart';

import '../../json/songs_json.dart';
import '../widget/song_card.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int activeMenu1 = 0;
  int activeMenu2 = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "My Playlist",
                style: TextStyle(
                    fontSize: 20, 
                    color: white, 
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.format_list_bulleted)
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Favorite albums",
                      style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: List.generate(songs.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          AlbumPage(song: songs[index]))));
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 180,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage(songs[index]['img']),
                                          fit: BoxFit.cover),
                                      color: primary,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  songs[index]['title'],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 180,
                                  child: Text(
                                    songs[index]['description'],
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: grey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "Favorite songs",
                      style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SongCard(
                        songlabel: "Pink Venom",
                        singer: "BlackPink",
                        image: AssetImage("assets/images/img_6.jpg"),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SongCard(
                        songlabel: "Bang Bang Bang",
                        singer: "Bigbang",
                        image: AssetImage("assets/images/img_9.jpg"),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SongCard(
                        songlabel: "Waiting For You",
                        singer: "MONO",
                        image: AssetImage("assets/images/img_1.jpg"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
