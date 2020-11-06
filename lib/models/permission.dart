class Perm {
  bool qeaAuth;
  bool meaAuth;
  bool seaAuth;
  bool teaAuth;
  bool mleaAuth;
  bool rleaAuth;

  Perm(
      {this.qeaAuth,
        this.meaAuth,
        this.seaAuth,
        this.teaAuth,
        this.mleaAuth,
        this.rleaAuth});

  Perm.fromJson(Map<String, dynamic> json) {
    qeaAuth = json['qea_auth'];
    meaAuth = json['mea_auth'];
    seaAuth = json['sea_auth'];
    teaAuth = json['tea_auth'];
    mleaAuth = json['mlea_auth'];
    rleaAuth = json['rlea_auth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qea_auth'] = this.qeaAuth;
    data['mea_auth'] = this.meaAuth;
    data['sea_auth'] = this.seaAuth;
    data['tea_auth'] = this.teaAuth;
    data['mlea_auth'] = this.mleaAuth;
    data['rlea_auth'] = this.rleaAuth;
    return data;
  }
}