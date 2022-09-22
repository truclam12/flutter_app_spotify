import 'package:flutter/material.dart';
import 'package:flutter_app_spotify/json/songs_json.dart';
import 'package:flutter_app_spotify/pages/screen/album_page.dart';
import 'package:flutter_app_spotify/pages/screen/song_page.dart';
import '../../theme/colors.dart';
import '../widget/rowAlbum_card.dart';
import '../widget/song_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                "Explore",
                style: TextStyle(
                    fontSize: 20, color: white, fontWeight: FontWeight.bold),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Row(
                        children: List.generate(songtype_1.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              activeMenu1 = index;
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                songtype_1[index],
                                style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        activeMenu1 == index ? primary : grey,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              activeMenu1 == index
                                  ? Container(
                                      width: 10,
                                      height: 3,
                                      decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      );
                    })),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
            
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                        "Top Hit",
                        style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    children: const [
                      RowAlbumCard(label: "Top 50 - Global",image: AssetImage("assets/images/img_10.jpg")),
                      SizedBox(width: 16),
                      RowAlbumCard(label: "Lo-Fi",image: AssetImage("assets/images/img_9.jpg")),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      RowAlbumCard(label: "Relax",image: AssetImage("assets/images/img_8.jpg")),
                      SizedBox(width: 16),
                      RowAlbumCard(label: "Deep Music",image: AssetImage("assets/images/img_7.jpg")),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      RowAlbumCard(label: "Chill Hits",image: AssetImage("assets/images/img_6.jpg")),
                      SizedBox(width: 16),
                      RowAlbumCard(label: "Peaceful",image: AssetImage("assets/images/img_5.jpg")),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Based on your recent listening",
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
                        songlabel: "Shay Nắnggg",
                        singer: "AMEE, Obito",
                        image: AssetImage("assets/images/img_2.jpg"),
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}