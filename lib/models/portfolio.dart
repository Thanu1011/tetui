import 'robot.dart';

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