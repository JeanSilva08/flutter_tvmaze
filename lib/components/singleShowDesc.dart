// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowImageDesc extends StatelessWidget {
  String imageUrl;
  ShowImageDesc({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                width: 298,
                height: 355,
              ))
        ],
      ),
    );
  }
}
