import 'package:fluttertui_app/models/qea.dart';
import 'package:fluttertui_app/networking_bot/apiProvider.dart';

import 'dart:async';
import 'dart:convert';


  class QeaRepository {
  ApiProvider _provider = ApiProvider();

  Future<Qea> fetchQea(String userName) async {
  print('------------' +
  'Enter: /repository/QeaRepository.fetchQea ' +
  userName);

  const route = "/fastapi_qea/";

  Map<String, dynamic> payLoadMap = {
  "username": "GeeVee",
  "singleRobot": {
  "name": "R01",
  "pl_size": 200,
  "threshold": {"pos": 5, "score": 9},
  "holding": {"fund": "Arrowstreet Global Equity", "pos": 11, "score": 7}
  }
  };

  print(json.encode(payLoadMap));

  Map<String, dynamic> response = await _provider.post(route, payLoadMap);

  return Qea.fromJson(response);
  }
  }