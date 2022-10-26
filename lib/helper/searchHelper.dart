// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter_tvmaze/Model/SearchModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<SearchModel>> fetchSearchShow(String showName) async {
  String searchUrl = "https://api.tvmaze.com/search/shows?q=$showName";
  final response = await http.get(Uri.parse(searchUrl));

  if (response.statusCode == 200) {
    List searchResponse = jsonDecode(response.body);
    return searchResponse.map((e) => SearchModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load show data');
  }
}
