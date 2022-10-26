// ignore_for_file: file_names

class EpisodeInfoList {
  final List<EpisodeInfoModel> episodes;

  EpisodeInfoList({required this.episodes});

  factory EpisodeInfoList.fromJson(List<dynamic> parsedEpisodes) {
    List<EpisodeInfoModel> episodeList = [];
    episodeList =
        parsedEpisodes.map((e) => EpisodeInfoModel.fromJson(e)).toList();
    return EpisodeInfoList(episodes: episodeList);
  }
}

class EpisodeInfoModel {
  int id;
  String episodeName;
  int numberEpisode;
  int seasonNumber;
  EpisodeImage episodeImage;
  String summary;

  EpisodeInfoModel(
      {required this.id,
      required this.episodeName,
      required this.seasonNumber,
      required this.episodeImage,
      required this.numberEpisode,
      required this.summary});

  factory EpisodeInfoModel.fromJson(Map<String, dynamic> episodeJson) {
    return EpisodeInfoModel(
        id: episodeJson['id'],
        episodeName: episodeJson['name'],
        seasonNumber: episodeJson['season'],
        numberEpisode: episodeJson['number'],
        episodeImage: EpisodeImage.fromJson(episodeJson['image']),
        summary: episodeJson['summary']);
  }
}

class EpisodeImage {
  String original;
  String medium;

  EpisodeImage({required this.medium, required this.original});

  factory EpisodeImage.fromJson(Map<String, dynamic> imagejson) {
    return EpisodeImage(
        medium: imagejson['medium'], original: imagejson['original']);
  }
}
