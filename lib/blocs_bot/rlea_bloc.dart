import 'dart:async';

import 'package:fluttertui_app/models/rlea.dart';
import 'package:fluttertui_app/repo_bot/rlea_repo.dart';

class RLeaBloc {
  RLeaRepository rleaRepository;

  RLeaBloc() {
    rleaRepository = RLeaRepository();
  }
  rleaBusinessLogic(String regUser, String mrRobot) async {
    RLea responseBody;
    String response;

    // trick here is to call it using await as this is an async call which returns Future<dynamic>, where dynamic == Auth
    responseBody = await fetchRLeaObj(regUser);

    if (responseBody == null) {
      response = 'Sorry - missing RLEA response.';
    } else if (responseBody.username != regUser) {
      response = 'Sorry - please register ' + regUser;
    } else {

      //Retrieve Tea object
      RlAdvice _rlAdvice = responseBody.rlAdvice;

      if (_rlAdvice == null) {
        response = "Problem with http POST response";
      } else {
        // Make sure to reference OUTPUT of FastAPI call
        response = "Agent: " +
            _rlAdvice.agent +
            " Level 0: " +
            _rlAdvice.level0 +
            " Level 1: " +
            _rlAdvice.level1 +
            " Level 2: " +
            _rlAdvice.level2 +
            " Level 3: " +
            _rlAdvice.level3 +
            "Tea Conf Sell: " +
            _rlAdvice.teaConfSell.toString() +
            "Tea Conf Buy: " +
            _rlAdvice.teaConfBuy.toString() +
            "Tea Conf Hold: " +
            _rlAdvice.teaConfHold.toString();
      }
    }

    print(response);

    return response;
  }

  fetchRLeaObj(String user) async {
    try {
      RLea rlea = await rleaRepository.fetchRLea(user);
      return rlea;
    } catch (e) {
      print(e);
    }
  }
}
