import 'dart:convert';

import 'package:flutter_tvmaze/Model/showModel2.dart';
import 'package:http/http.dart' as http;

Future<List<ShowModel2>> fetchShowData() async {
  String tvmazeUrl = "https://api.tvmaze.com/shows";
  final response = await http.get(Uri.parse(tvmazeUrl));

  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((e) => ShowModel2.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load show data');
  }
}
