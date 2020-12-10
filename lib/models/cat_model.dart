import 'dart:convert';

List<CatModel> catsFromJson(var str) {
  print(str);
  return List<CatModel>.from(json.decode(str).map((x) => CatModel.fromJson(x)));
}

class CatModel {
  String sId;
  String text;
  String type;
  UserModel user;
  int upvotes;
  Null userUpvoted;

  CatModel(
      {this.sId,
      this.text,
      this.type,
      this.user,
      this.upvotes,
      this.userUpvoted});

  CatModel.fromJson(Map json) {
    sId = json['_id'];
    text = json['text'];
    type = json['type'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    upvotes = json['upvotes'];
    userUpvoted = json['userUpvoted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['text'] = this.text;
    data['type'] = this.type;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['upvotes'] = this.upvotes;
    data['userUpvoted'] = this.userUpvoted;
    return data;
  }
}

class UserModel {
  String sId;
  NameModel name;

  UserModel({this.sId, this.name});

  UserModel.fromJson(Map json) {
    sId = json['_id'];
    name = json['name'] != null ? new NameModel.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    return data;
  }
}

class NameModel {
  String first;
  String last;

  NameModel({this.first, this.last});

  NameModel.fromJson(Map json) {
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}
