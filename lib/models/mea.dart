class Mea {
  String username;
  MeaAdvice meaAdvice;

  Mea({this.username, this.meaAdvice});

  Mea.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    meaAdvice = json['meaAdvice'] != null
        ? new MeaAdvice.fromJson(json['meaAdvice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    if (this.meaAdvice != null) {
      data['meaAdvice'] = this.meaAdvice.toJson();
    }
    return data;
  }
}

class MeaAdvice {
  String agent;
  String level0;
  String level1;
  String level2;
  String level3;
  double meaConfSell;
  double meaConfBuy;
  int meaConfHold;

  MeaAdvice(
      {this.agent,
        this.level0,
        this.level1,
        this.level2,
        this.level3,
        this.meaConfSell,
        this.meaConfBuy,
        this.meaConfHold});

  MeaAdvice.fromJson(Map<String, dynamic> json) {
    agent = json['agent'];
    level0 = json['level_0'];
    level1 = json['level_1'];
    level2 = json['level_2'];
    level3 = json['level_3'];
    meaConfSell = json['mea_conf_sell'];
    meaConfBuy = json['mea_conf_buy'];
    meaConfHold = json['mea_conf_hold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agent'] = this.agent;
    data['level_0'] = this.level0;
    data['level_1'] = this.level1;
    data['level_2'] = this.level2;
    data['level_3'] = this.level3;
    data['mea_conf_sell'] = this.meaConfSell;
    data['mea_conf_buy'] = this.meaConfBuy;
    data['mea_conf_hold'] = this.meaConfHold;
    return data;
  }
}