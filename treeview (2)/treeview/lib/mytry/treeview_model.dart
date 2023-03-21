class TreeviewModel {
  List<Lists>? lists;
  bool? status;
  String? code;
  String? errorMessage;

  TreeviewModel({this.lists, this.status, this.code, this.errorMessage});

  TreeviewModel.fromJson(Map<String, dynamic> json) {
    lists = json["lists"] == null
        ? null
        : (json["lists"] as List).map((e) => Lists.fromJson(e)).toList();
    status = json["Status"];
    code = json["Code"];
    errorMessage = json["ErrorMessage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (lists != null) {
      _data["lists"] = lists?.map((e) => e.toJson()).toList();
    }
    _data["Status"] = status;
    _data["Code"] = code;
    _data["ErrorMessage"] = errorMessage;
    return _data;
  }
}

class Lists {
  int? id;
  String? name;
  String? code;
  int? level;
  String? gender;
  dynamic parentId;

  Lists(
      {this.id, this.name, this.code, this.level, this.gender, this.parentId});

  Lists.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    code = json["code"];
    level = json["level"];
    gender = json["gender"];
    parentId = json["parentID"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["code"] = code;
    _data["level"] = level;
    _data["gender"] = gender;
    _data["parentID"] = parentId;
    return _data;
  }
}
