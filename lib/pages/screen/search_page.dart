import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_spotify/theme/colors.dart';

import '../widget/search_album.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                "Search",
                style: TextStyle(
                    fontSize: 20, color: white, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.format_list_bulleted)
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: black,
                  ),
                  suffixIcon: const Icon(Icons.close, color: black),
                  hintText: "What do you want to hear...?",
                  hintStyle: const TextStyle(color: black, fontSize: 17),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Browse all",
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: const [
                    SearchAlbum(
                        image: AssetImage("assets/images/test.jpg"), 
                        title: "Study beats",
                    ),
                    SizedBox(width: 16),
                    SearchAlbum(
                        image: AssetImage("assets/images/test.jpg"),
                        title: "Study beats",
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    SearchAlbum(
                        image: AssetImage("assets/images/test.jpg"), 
                        title: "Study beats",
                    ),
                    SizedBox(width: 16),
                    SearchAlbum(
                        image: AssetImage("assets/images/test.jpg"),
                        title: "Study beats",
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    SearchAlbum(
                        image: AssetImage("assets/images/test.jpg"), 
                        title: "Study beats",
                    ),
                    SizedBox(width: 16),
                    SearchAlbum(
                        image: AssetImage("assets/images/test.jpg"),
                        title: "Study beats",
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
