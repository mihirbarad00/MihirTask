
class Model {
    String? id;
    String? fileThumb;
    String? fileName;

    Model({this.id, this.fileThumb, this.fileName});

    Model.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        fileThumb = json["file_thumb"];
        fileName = json["file_name"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["file_thumb"] = fileThumb;
        _data["file_name"] = fileName;
        return _data;
    }
}