import 'dart:async';

import 'package:fluttertui_app/models/mlea.dart';
import 'package:fluttertui_app/repo_bot/mlea_repo.dart';

class MLeaBloc {
  MLeaRepository mleaRepository;

  MLeaBloc() {
    mleaRepository = MLeaRepository();
  }
  mleaBusinessLogic(String regUser, String mrRobot) async {
    MLea responseBody;
    String response;

    // trick here is to call it using await as this is an async call which returns Future<dynamic>, where dynamic == Auth
    responseBody = await fetchMLeaObj(regUser);

    if (responseBody == null) {
      response = 'Sorry - missing MLEA response.';
    } else if (responseBody.username != regUser) {
      response = 'Sorry - please register ' + regUser;
    } else {

      //Retrieve Tea object
      MlAdvice _mlAdvice = responseBody.mlAdvice;

      if (_mlAdvice == null) {
        response = "Problem with http POST response";
      } else {
        // Make sure to reference OUTPUT of FastAPI call
        response = "Agent: " +
            _mlAdvice.agent +
            " Level 0: " +
            _mlAdvice.level0 +
            " Level 1: " +
            _mlAdvice.level1 +
            " Level 2: " +
            _mlAdvice.level2 +
            " Level 3: " +
            _mlAdvice.level3 +
            "Tea Conf Sell: " +
            _mlAdvice.teaConfSell.toString() +
            "Tea Conf Buy: " +
            _mlAdvice.teaConfBuy.toString() +
            "Tea Conf Hold: " +
            _mlAdvice.teaConfHold.toString();
      }
    }

    print(response);

    return response;
  }

  fetchMLeaObj(String user) async {
    try {
      MLea mlea = await mleaRepository.fetchMLea(user);
      return mlea;
    } catch (e) {
      print(e);
    }
  }
}
