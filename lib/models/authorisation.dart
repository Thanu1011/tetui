class Auth {
String username;
Portfolio portfolio;
Perm perm;

Auth({this.username, this.portfolio, this.perm});

Auth.fromJson(Map<String, dynamic> json) {
username = json['username'];
portfolio = json['portfolio'] != null
? new Portfolio.fromJson(json['portfolio'])
    : null;
perm = json['perm'] != null ? new Perm.fromJson(json['perm']) : null;
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['username'] = this.username;
  if (this.portfolio != null) {
    data['portfolio'] = this.portfolio.toJson();
  }
  if (this.perm != null) {
    data['perm'] = this.perm.toJson();
  }
  return data;
}
}

class Portfolio {
  String strategy;
  String serviceLevel;
  Robots robots;

  Portfolio({this.strategy, this.serviceLevel, this.robots});

  Portfolio.fromJson(Map<String, dynamic> json) {
    strategy = json['strategy'];
    serviceLevel = json['service_level'];
    robots =
    json['robots'] != null ? new Robots.fromJson(json['robots']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strategy'] = this.strategy;
    data['service_level'] = this.serviceLevel;
    if (this.robots != null) {
      data['robots'] = this.robots.toJson();
    }
    return data;
  }
}

class Robots {
  String r01;
  String r02;
  String r03;
  String r04;
  String r05;
  String r06;
  String r07;
  String r08;
  String r09;
  String r10;
  String r11;
  String r12;
  String r13;
  String r14;

  Robots(
      {this.r01,
        this.r02,
        this.r03,
        this.r04,
        this.r05,
        this.r06,
        this.r07,
        this.r08,
        this.r09,
        this.r10,
        this.r11,
        this.r12,
        this.r13,
        this.r14});

  Robots.fromJson(Map<String, dynamic> json) {
    r01 = json['R01'];
    r02 = json['R02'];
    r03 = json['R03'];
    r04 = json['R04'];
    r05 = json['R05'];
    r06 = json['R06'];
    r07 = json['R07'];
    r08 = json['R08'];
    r09 = json['R09'];
    r10 = json['R10'];
    r11 = json['R11'];
    r12 = json['R12'];
    r13 = json['R13'];
    r14 = json['R14'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['R01'] = this.r01;
    data['R02'] = this.r02;
    data['R03'] = this.r03;
    data['R04'] = this.r04;
    data['R05'] = this.r05;
    data['R06'] = this.r06;
    data['R07'] = this.r07;
    data['R08'] = this.r08;
    data['R09'] = this.r09;
    data['R10'] = this.r10;
    data['R11'] = this.r11;
    data['R12'] = this.r12;
    data['R13'] = this.r13;
    data['R14'] = this.r14;
    return data;
  }
}

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