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
  String r15;

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
        this.r14,
        this.r15});

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
    r15 = json['R15'];
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
    data['R15'] = this.r15;
    return data;
  }
}
class Robot {
  int id;
  String name;

  Robot(this.id, this.name);

  static List<Robot> getRobots() {
    return <Robot>[
      Robot(1, 'R01'),
      Robot(2, 'R02'),
      Robot(3, 'R03'),
      Robot(4, 'R04'),
      Robot(5, 'R05'),
      Robot(6, 'R06'),
      Robot(7, 'R07'),
      Robot(8, 'R08'),
      Robot(9, 'R09'),
      Robot(10, 'R010'),
      Robot(11, 'R011'),
      Robot(12, 'R012'),
      Robot(13, 'R013'),
      Robot(14, 'R014'),
      Robot(15, 'R015'),


    ];
  }
}
