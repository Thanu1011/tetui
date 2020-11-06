import 'dart:async';

import 'package:fluttertui_app/models/qea.dart';
import 'package:fluttertui_app/repo_bot/qea_repo.dart';

class QeaBloc {
  QeaRepository qeaRepository;

  QeaBloc() {
    qeaRepository = QeaRepository();
  }

  qeaBusinessLogic(String regUser, String mrRobot) async {
    Qea responseBody;
    String response;

    // trick here is to call it using await as this is an async call which returns Future<dynamic>, where dynamic == Auth
    responseBody = await fetchQeaObj(regUser);

    if (responseBody == null) {
      response = 'Sorry - missing QEA response.';
    } else if (responseBody.username != regUser) {
      response = 'Sorry - please register ' + regUser;
    } else {
      //Retrieve Robot Ladder object
      SingleRobot _ladder = responseBody.singleRobot;

      //Retrieve QEA advice
      QeaAdvice _qeaAdvice = responseBody.qeaAdvice;

      // Make sure to reference OUTPUT of FastAPI call
      response = "Robot Name: " +
          _ladder.name +
          " PL Size: " +
          _ladder.plSize.toString() +
          " Ladder Position: " +
          _ladder.threshold.pos.toString() +
          " Ladder Score: " +
          _ladder.threshold.score.toString() +
          " Current holding: " +
          _ladder.holding.fund +
          "Current ladder position: " +
          _ladder.holding.pos.toString() +
          "QEA Advice: " + "\n" +
          _qeaAdvice.advice;
    }
    print(response);

    return response;
  }

  fetchQeaObj(String user) async {
    try {
      Qea qea = await qeaRepository.fetchQea(user);
      return qea;
    } catch (e) {
      print(e);
    }
  }
}