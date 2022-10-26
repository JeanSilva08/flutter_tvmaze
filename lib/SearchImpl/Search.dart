// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_tvmaze/Model/SearchModel.dart';
import 'package:flutter_tvmaze/helper/searchHelper.dart';
import 'package:flutter_tvmaze/views/resultSearch.dart';

class MovieSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //actions for appBar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //leading icon on the left of the appbar
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    //show result based on the selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show suggestions when someone searches for something
    return FutureBuilder<List<SearchModel>>(
        future: fetchSearchShow(query),
        builder: (context, snapshot) {
          if (query.isEmpty) {
            return buildNoSuggestions();
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
            default:
              if (snapshot.hasError || snapshot.data!.isEmpty) {
                return buildNoSuggestions();
              } else {
                return buildSuggestionsSuccess(snapshot.data!);
              }
          }
        });
  }
}

Widget buildNoSuggestions() {
  // ignore: prefer_const_constructors
  return Center(
    child: const Text(
      "No suggestions!",
    ),
  );
}

Widget buildSuggestionsSuccess(
  List<SearchModel> suggestions,
) {
  return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        final queryText = suggestion.show!.name.toString();
        final queryImage = suggestion.show!.image!.medium.toString();
        final gid = suggestion.show!.id;
        final querySummary = suggestion.show!.summary.toString();

        return InkWell(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultSearch(
                            id: gid!,
                            name: queryText,
                            imgUrl: queryImage,
                            summary: querySummary)))
                .then((value) => Navigator.pop(context));
          },
          child: ListTile(
            // ignore: prefer_const_constructors
            leading: Icon(Icons.info),
            title: Text(queryText),
          ),
        );
      });
}
