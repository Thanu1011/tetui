class Qea {
  String username;
  SingleRobot singleRobot;
  QeaAdvice qeaAdvice;

  Qea({this.username, this.singleRobot, this.qeaAdvice});

  Qea.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    singleRobot = json['singleRobot'] != null
        ? new SingleRobot.fromJson(json['singleRobot'])
        : null;
    qeaAdvice = json['qeaAdvice'] != null
        ? new QeaAdvice.fromJson(json['qeaAdvice'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    if (this.singleRobot != null) {
      data['singleRobot'] = this.singleRobot.toJson();
    }
    if (this.qeaAdvice != null) {
      data['qeaAdvice'] = this.qeaAdvice.toJson();
    }
    return data;
  }
}

class SingleRobot {
  String name;
  int plSize;
  Threshold threshold;
  Holding holding;

  SingleRobot({this.name, this.plSize, this.threshold, this.holding});

  SingleRobot.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    plSize = json['pl_size'];
    threshold = json['threshold'] != null
        ? new Threshold.fromJson(json['threshold'])
        : null;
    holding =
    json['holding'] != null ? new Holding.fromJson(json['holding']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pl_size'] = this.plSize;
    if (this.threshold != null) {
      data['threshold'] = this.threshold.toJson();
    }
    if (this.holding != null) {
      data['holding'] = this.holding.toJson();
    }
    return data;
  }
}

class Threshold {
  int pos;
  int score;

  Threshold({this.pos, this.score});

  Threshold.fromJson(Map<String, dynamic> json) {
    pos = json['pos'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pos'] = this.pos;
    data['score'] = this.score;
    return data;
  }
}

class Holding {
  String fund;
  int pos;
  int score;

  Holding({this.fund, this.pos, this.score});

  Holding.fromJson(Map<String, dynamic> json) {
    fund = json['fund'];
    pos = json['pos'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fund'] = this.fund;
    data['pos'] = this.pos;
    data['score'] = this.score;
    return data;
  }
}

class QeaAdvice {
  String agent;
  String advice;
  Signal signal;
  String level0;
  String level1;
  String level2;
  String level3;

  QeaAdvice(
      {this.agent,
        this.advice,
        this.signal,
        this.level0,
        this.level1,
        this.level2,
        this.level3});

  QeaAdvice.fromJson(Map<String, dynamic> json) {
    agent = json['agent'];
    advice = json['advice'];
    signal =
    json['signal'] != null ? new Signal.fromJson(json['signal']) : null;
    level0 = json['level_0'];
    level1 = json['level_1'];
    level2 = json['level_2'];
    level3 = json['level_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agent'] = this.agent;
    data['advice'] = this.advice;
    if (this.signal != null) {
      data['signal'] = this.signal.toJson();
    }
    data['level_0'] = this.level0;
    data['level_1'] = this.level1;
    data['level_2'] = this.level2;
    data['level_3'] = this.level3;
    return data;
  }
}

class Signal {
  String action;
  String sell;
  String buy;

  Signal({this.action, this.sell, this.buy});

  Signal.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    sell = json['sell'];
    buy = json['buy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['sell'] = this.sell;
    data['buy'] = this.buy;
    return data;
  }
}
