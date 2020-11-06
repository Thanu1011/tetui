import 'dart:async';

import 'package:fluttertui_app/models/tea.dart';
import 'package:fluttertui_app/repo_bot/tea_repo.dart';


class TeaBloc {
  TeaRepository teaRepository;

  TeaBloc() {
    teaRepository = TeaRepository();
  }

  teaBusinessLogic(String regUser, String mrRobot) async {
    Tea responseBody;
    String response;

    // trick here is to call it using await as this is an async call which returns Future<dynamic>, where dynamic == Auth
    responseBody = await fetchTeaObj(regUser);

    if (responseBody == null) {
      response = 'Sorry - missing SEA response.';
    } else if (responseBody.username != regUser) {
      response = 'Sorry - please register ' + regUser;
    } else {
      //Retrieve Mea object
      TeaAdvice _teaAdvice = responseBody.teaAdvice;

      if (_teaAdvice == null) {
        response = "Problem with http POST response";
      } else {
        // Make sure to reference OUTPUT of FastAPI call
        response = "Agent: " +
            _teaAdvice.agent +
            " Level 0: " +
            _teaAdvice.level0 +
            " Level 1: " +
            _teaAdvice.level1 +
            " Level 2: " +
            _teaAdvice.level2 +
            " Level 3: " +
            _teaAdvice.level3 +
            "Tea Conf Sell: " +
            _teaAdvice.teaConfSell.toString() +
            "Tea Conf Buy: " +
            _teaAdvice.teaConfBuy.toString() +
            "Tea Conf Hold: " +
            _teaAdvice.teaConfHold.toString();
      }
    }

    print(response);

    return response;
  }

  fetchTeaObj(String user) async {
    try {
      Tea tea = await teaRepository.fetchTea(user);
      return tea;
    } catch (e) {
      print(e);
    }
  }
}
