// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_tvmaze/views/episodes_info.dart';

// ignore: must_be_immutable
class ShowCard extends StatelessWidget {
  final String showImage, title, imgUrl, summary;
  final int id;
  List<String> genres = [];

  ShowCard(
      {Key? key,
      required this.showImage,
      required this.title,
      required this.id,
      required this.imgUrl,
      required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6, bottom: 6),
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                showImage,
                fit: BoxFit.fill,
                width: double.infinity,
                height: 300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(80, 8, 0, 16),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                // SizedBox(
                //   width: 172,
                // ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      displayBottomSheet(context, id, imgUrl, title, summary);
                    },
                    icon: const Icon(Icons.more_vert)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

displayBottomSheet(
    BuildContext context, int id, String imgUrl, String name, String summary) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: const Color(0xFF737373),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text("Episodes and Info"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EpisodesInfo(
                                  id: id,
                                  imgUrl: imgUrl,
                                  name: name,
                                  summary: summary,
                                ))).then((value) => Navigator.pop(context));
                  },
                ),
              ],
            ),
          ),
        );
      });
}
