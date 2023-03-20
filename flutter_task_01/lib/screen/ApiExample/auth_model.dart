class AuthModel {
  bool? status;
  Message? message;

  AuthModel({this.status, this.message});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message =
        json["message"] == null ? null : Message.fromJson(json["message"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if (message != null) {
      _data["message"] = message?.toJson();
    }
    return _data;
  }
}

class Message {
  List<Yearlygoalslist>? yearlygoalslist;

  Message({this.yearlygoalslist});

  Message.fromJson(Map<String, dynamic> json) {
    yearlygoalslist = json["yearlygoalslist"] == null
        ? null
        : (json["yearlygoalslist"] as List)
            .map((e) => Yearlygoalslist.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (yearlygoalslist != null) {
      _data["yearlygoalslist"] =
          yearlygoalslist?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Yearlygoalslist {
  String? programId;
  String? programName;
  String? isChecked;
  Keyvalue? keyvalue;

  Yearlygoalslist(
      {this.programId, this.programName, this.isChecked, this.keyvalue});

  Yearlygoalslist.fromJson(Map<String, dynamic> json) {
    programId = json["program_id"];
    programName = json["program_name"];
    isChecked = json["is_checked"];
    keyvalue =
        json["keyvalue"] == null ? null : Keyvalue.fromJson(json["keyvalue"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["program_id"] = programId;
    _data["program_name"] = programName;
    _data["is_checked"] = isChecked;
    if (keyvalue != null) {
      _data["keyvalue"] = keyvalue?.toJson();
    }
    return _data;
  }
}

class Keyvalue {
  dynamic mti = null;

  Keyvalue({this.mti = null});

  Keyvalue.fromJson(Map<String, dynamic> json) {
    mti = json["MTI="];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["MTI="] = mti = null;
    return _data;
  }
}
