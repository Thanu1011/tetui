class AuthUsers {
  User user;

  AuthUsers({this.user});

  AuthUsers.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String s001;
  String s002;
  String s003;

  User({this.s001, this.s002, this.s003});

  User.fromJson(Map<String, dynamic> json) {
    s001 = json['001'];
    s002 = json['002'];
    s003 = json['003'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['001'] = this.s001;
    data['002'] = this.s002;
    data['003'] = this.s003;
    return data;
  }
}