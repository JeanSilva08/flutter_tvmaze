// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class EpisodeCard extends StatelessWidget {
  String episodeImgUrl, episodeName, episodeSummary;
  int seasonNumber, numberEpisode;

  EpisodeCard(
      {Key? key,
      required this.episodeImgUrl,
      required this.episodeName,
      required this.seasonNumber,
      required this.numberEpisode,
      required this.episodeSummary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      child: Card(
        elevation: 20,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8, left: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      episodeImgUrl,
                      width: 160,
                      height: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 24),
                            child: Text("Season ",
                                style: TextStyle(
                                    letterSpacing: 0.7,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Text(
                            seasonNumber.toString(),
                            style: const TextStyle(
                                letterSpacing: 0.7,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(numberEpisode.toString() + ".",
                                  style: const TextStyle(
                                      letterSpacing: 0.6,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))),
                          Expanded(
                            child: Text(episodeName,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                                style: const TextStyle(
                                  // letterSpacing: 0.6,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Html(
                data: episodeSummary,
                style: {"body": Style(fontSize: const FontSize(15.0))}),
          ],
        ),
      ),
    );
  }
}
