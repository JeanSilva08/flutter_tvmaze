// ignore_for_file: file_names

class ShowModel2 {
  int id;
  String name;
  List<String> genre;
  Image image;
  String url;
  String? urlToOfficialSite;
  String summary;

  ShowModel2(
      {required this.id,
      required this.name,
      required this.genre,
      required this.image,
      required this.url,
      required this.urlToOfficialSite,
      required this.summary});

  factory ShowModel2.fromJson(Map<String, dynamic> json) {
    var genres = json['genres'];
    List<String> genreList = genres.cast<String>();
    return ShowModel2(
        id: json['id'],
        name: json['name'],
        genre: genreList,
        image: Image.fromJson(json['image']),
        url: json['url'],
        urlToOfficialSite: json['officialSite'],
        summary: json['summary']);
  }
}

class Image {
  String original;
  String medium;

  Image({required this.medium, required this.original});

  factory Image.fromJson(Map<String, dynamic> imagejson) {
    return Image(medium: imagejson['medium'], original: imagejson['original']);
  }
}
