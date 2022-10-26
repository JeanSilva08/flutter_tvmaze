// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

class SearchModel {
  Show? show;

  SearchModel({this.show});

  SearchModel.fromJson(Map<String, dynamic> json) {
    show = json['show'] != null ? Show.fromJson(json['show']) : null;
  }
}

class Show {
  int? id;
  String? name;
  Image? image;
  String? summary;

  Show({this.id, this.image, this.name, this.summary});

  Show.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    summary = json['summary'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }
}

class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }
}
