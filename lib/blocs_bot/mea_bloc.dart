import 'dart:async';

import 'package:fluttertui_app/models/mea.dart';
import 'package:fluttertui_app/repo_bot/mea_repo.dart';

class MeaBloc {
  MeaRepository meaRepository;

  MeaBloc() {
    meaRepository = MeaRepository();
  }

  meaBusinessLogic(String regUser, String mrRobot) async {
    Mea responseBody;
    String response;

    // trick here is to call it using await as this is an async call which returns Future<dynamic>, where dynamic == Auth
    responseBody = await fetchMeaObj(regUser);

    if (responseBody == null) {
      response = 'Sorry - missing MEA response.';
    } else if (responseBody.username != regUser) {
      response = 'Sorry - please register ' + regUser;
    } else {

      //Retrieve Mea object
      MeaAdvice _meaAdvice = responseBody.meaAdvice;

      if (_meaAdvice == null) {
        response = "Problem with http POST response";
      } else {
        // Make sure to reference OUTPUT of FastAPI call
        response = "Agent: " +
            _meaAdvice.agent +
            " Level 0: " +
            _meaAdvice.level0 +
            " Level 1: " +
            _meaAdvice.level1 +
            " Level 2: " +
            _meaAdvice.level2 +
            " Level 3: " +
            _meaAdvice.level3 +
            "Sea Conf Sell: " +
            _meaAdvice.meaConfSell.toString() +
            "Sea Conf Buy: " +
            _meaAdvice.meaConfBuy.toString() +
            "Sea Conf Hold: " +
            _meaAdvice.meaConfHold.toString();
      }
    }

    print(response);

    return response;
  }

  fetchMeaObj(String user) async {
    try {
      Mea mea = await meaRepository.fetchMea(user);
      return mea;
    } catch (e) {
      print(e);
    }
  }
}
