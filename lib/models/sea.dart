


class Sea {
  String username;
  SeaAdvice seaAdvice;

  Sea({this.username, this.seaAdvice});

  Sea.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    seaAdvice = json['seaAdvice'] != null
        ? new SeaAdvice.fromJson(json['seaAdvice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    if (this.seaAdvice != null) {
      data['seaAdvice'] = this.seaAdvice.toJson();
    }
    return data;
  }
}

class SeaAdvice {
  String agent;
  String level0;
  String level1;
  String level2;
  String level3;
  int seaConfSell;
  int seaConfBuy;
  int seaConfHold;

  SeaAdvice(
      {this.agent,
        this.level0,
        this.level1,
        this.level2,
        this.level3,
        this.seaConfSell,
        this.seaConfBuy,
        this.seaConfHold});

  SeaAdvice.fromJson(Map<String, dynamic> json) {
    agent = json['agent'];
    level0 = json['level_0'];
    level1 = json['level_1'];
    level2 = json['level_2'];
    level3 = json['level_3'];
    seaConfSell = json['sea_conf_sell'];
    seaConfBuy = json['sea_conf_buy'];
    seaConfHold = json['sea_conf_hold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agent'] = this.agent;
    data['level_0'] = this.level0;
    data['level_1'] = this.level1;
    data['level_2'] = this.level2;
    data['level_3'] = this.level3;
    data['sea_conf_sell'] = this.seaConfSell;
    data['sea_conf_buy'] = this.seaConfBuy;
    data['sea_conf_hold'] = this.seaConfHold;
    return data;
  }
}
