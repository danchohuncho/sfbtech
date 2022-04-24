class VideoModel {
/*  String? photographer;
  String? photographerURL;
  int? photographerID;
  SrcModel? src;*/
  final int id;
  final String quality;
  final String link;

  const VideoModel(this.id, this.quality, this.link);

  VideoModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        quality = json["quality"] ?? "",
        link = json["link"] ?? "";
}

class SrcModel {
  // String original;
  String link;

  SrcModel({
    // required this.original,
    required this.link,
  });

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      // original: jsonData["original"],
      // small: jsonData["small"],
      link: jsonData["link"],
    );
  }
}
