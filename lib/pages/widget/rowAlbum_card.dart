import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../theme/colors.dart';

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;

  const RowAlbumCard({Key? key, required this.image, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Image(image: image,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
              ),
              const SizedBox(width: 12,),
              Text(
                label,
                style: const TextStyle(
                  color: white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
   
  }
}