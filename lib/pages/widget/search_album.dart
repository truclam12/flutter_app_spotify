import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../theme/colors.dart';

class SearchAlbum extends StatelessWidget {
  final AssetImage image;
  final String title;

  const SearchAlbum({Key? key, required this.image, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Stack(
          children: <Widget>[
            Container(
              width: 170,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: image,
                      fit: BoxFit.cover),
                  color: primary,
                  borderRadius: BorderRadius.circular(8)),
            ),
            Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text(
                title,
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
