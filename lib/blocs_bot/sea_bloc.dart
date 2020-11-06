import 'dart:async';

import 'package:fluttertui_app/models/sea.dart';
import 'package:fluttertui_app/repo_bot/sea_repo.dart';

class SeaBloc {
  SeaRepository seaRepository;

SeaBloc() {
  seaRepository = SeaRepository();
}

seaBusinessLogic(String regUser, String mrRobot) async {
  Sea responseBody;
  String response;

  // trick here is to call it using await as this is an async call which returns Future<dynamic>, where dynamic == Auth
  responseBody = await fetchSeaObj(regUser);

  if (responseBody == null) {
    response = 'Sorry - missing SEA response.';
  } else if (responseBody.username != regUser) {
    response = 'Sorry - please register ' + regUser;
  } else {

    //Retrieve Mea object
    SeaAdvice _seaAdvice = responseBody.seaAdvice;

    if (_seaAdvice == null) {
      response = "Problem with http POST response";
    } else {
      // Make sure to reference OUTPUT of FastAPI call
      response = "Agent: " +
          _seaAdvice.agent +
          " Level 0: " +
          _seaAdvice.level0 +
          " Level 1: " +
          _seaAdvice.level1 +
          " Level 2: " +
          _seaAdvice.level2 +
          " Level 3: " +
          _seaAdvice.level3 +
          "Sea Conf Sell: " +
          _seaAdvice.seaConfSell.toString() +
          "Sea Conf Buy: " +
          _seaAdvice.seaConfBuy.toString() +
          "Sea Conf Hold: " +
          _seaAdvice.seaConfHold.toString();
    }
  }

  print(response);

  return response;
}

fetchSeaObj(String user) async {
  try {
    Sea sea = await seaRepository.fetchSea(user);
    return sea;
  } catch (e) {
    print(e);
  }
}
}