class Tea {
  String username;
  TeaAdvice teaAdvice;

  Tea({this.username, this.teaAdvice});

  Tea.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    teaAdvice = json['teaAdvice'] != null
        ? new TeaAdvice.fromJson(json['teaAdvice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    if (this.teaAdvice != null) {
      data['teaAdvice'] = this.teaAdvice.toJson();
    }
    return data;
  }
}

class TeaAdvice {
  String agent;
  String level0;
  String level1;
  String level2;
  String level3;
  double teaConfSell;
  int teaConfBuy;
  int teaConfHold;

  TeaAdvice(
      {this.agent,
        this.level0,
        this.level1,
        this.level2,
        this.level3,
        this.teaConfSell,
        this.teaConfBuy,
        this.teaConfHold});

  TeaAdvice.fromJson(Map<String, dynamic> json) {
    agent = json['agent'];
    level0 = json['level_0'];
    level1 = json['level_1'];
    level2 = json['level_2'];
    level3 = json['level_3'];
    teaConfSell = json['tea_conf_sell'];
    teaConfBuy = json['tea_conf_buy'];
    teaConfHold = json['tea_conf_hold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agent'] = this.agent;
    data['level_0'] = this.level0;
    data['level_1'] = this.level1;
    data['level_2'] = this.level2;
    data['level_3'] = this.level3;
    data['tea_conf_sell'] = this.teaConfSell;
    data['tea_conf_buy'] = this.teaConfBuy;
    data['tea_conf_hold'] = this.teaConfHold;
    return data;
  }
}