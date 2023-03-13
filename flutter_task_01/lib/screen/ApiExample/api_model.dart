class ApiModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  ApiModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  ApiModel.fromJson(Map<String, dynamic> json) {
    albumId = json["albumId"];
    id = json["id"];
    title = json["title"];
    url = json["url"];
    thumbnailUrl = json["thumbnailUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["albumId"] = albumId;
    _data["id"] = id;
    _data["title"] = title;
    _data["url"] = url;
    _data["thumbnailUrl"] = thumbnailUrl;
    return _data;
  }
}
