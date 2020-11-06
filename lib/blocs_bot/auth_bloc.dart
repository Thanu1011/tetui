import 'dart:async';

import 'package:fluttertui_app/repo_bot/auth_repository.dart';
import 'package:fluttertui_app/models/authorisation.dart';


class AuthBloc {
  AuthRepository authRepository;

  AuthBloc() {
    authRepository = AuthRepository();
  }

  authBusinessLogic(String regUser) async {
    Auth responseBody;
    String response;

    // trick here is to call it using await as this is an async call which returns Future<dynamic>, where dynamic == Auth
    responseBody = await fetchAuthObj(regUser);

    if (responseBody == null) {
      response = 'Sorry - missing Auth response.';
    } else if (responseBody.username != regUser) {
      response = 'Sorry - please register ' + regUser;
    } else {
      //Retrieve Auth objects
      String userName = responseBody.username;

      Portfolio folio = responseBody.portfolio;
      Perm perm = responseBody.perm;

      if (userName == null) {
        response = "Problem with GET command";
      } else {
        // Make sure to reference OUTPUT of FastAPI call
        response = "Strategy: " +
            folio.strategy +
            "\n" +
            "Service Level: " +
            folio.serviceLevel +
            "\n" +
            "QEA permission: " +
            perm.qeaAuth.toString() +
            "\n" +
            "MEA permission: " +
            perm.meaAuth.toString() +
            "\n" +
            "SEA permission: " +
            perm.seaAuth.toString() +
            "\n" +
            "TEA permission: " +
            perm.teaAuth.toString() +
            "\n" +
            "MLEA permission: " +
            perm.mleaAuth.toString() +
            "\n" +
            "RLEA permission: " +
            perm.rleaAuth.toString();
      }
    }

    print(response);

    // if you want to return a String to _widget
    return response;

    // if you want to return the object to _widget
    //return responseBody;
  }

  fetchAuthObj(String user) async {
    try {
      Auth auth = await authRepository.fetchAuth(user);
      return auth;
    } catch (e) {
      print(e);
    }
  }
}