import 'package:fluttertui_app/models/authorisation.dart';
import 'package:fluttertui_app/models/qea.dart';
import 'package:fluttertui_app/models/mea.dart';
import 'package:fluttertui_app/models/sea.dart';

import 'package:fluttertui_app/repo_bot/auth_repository.dart';
import 'package:fluttertui_app/repo_bot/qea_repo.dart';
import 'package:fluttertui_app/repo_bot/mea_repo.dart';
import 'package:fluttertui_app/repo_bot/sea_repo.dart';

class ESBloc {
  AuthRepository authRepository;
  QeaRepository qeaRepository;
  MeaRepository meaRepository;
  SeaRepository seaRepository;

  ESBloc() {
    authRepository = AuthRepository();
    qeaRepository = QeaRepository();
    meaRepository = MeaRepository();
    seaRepository = SeaRepository();
  }

  esBusinessLogic(String regUser, String robot) async {
    Auth authResponseBody;
    Qea qeaResponseBody;
    Mea meaResponseBody;
    Sea seaResponseBody;

    String authResponse;
    String qeaResponse;
    String meaResponse;
    String seaResponse;

    String esResponse;

    // trick here is to call it using await as this is an async call which returns Future<dynamic>, where dynamic == Auth
    authResponseBody = await fetchAuthObj(regUser);
    qeaResponseBody = await fetchQeaObj(regUser);
    meaResponseBody = await fetchMeaObj(regUser);
    seaResponseBody = await fetchSeaObj(regUser);

    if (authResponseBody == null) {
      authResponse = 'Sorry - missing Auth response.';
    } else if (authResponseBody.username != regUser) {
      authResponse = 'Sorry - please register ' + regUser;
    } else {
      // BUSINESS LOGIC

      //Retrieve Auth objects
      String _userName = authResponseBody.username;
      Portfolio _folio = authResponseBody.portfolio;
      Perm _perm = authResponseBody.perm;

      if (_userName == null) {
        authResponse = "Problem with AUTH Get";
      } else {
        // Make sure to reference OUTPUT of FastAPI call
        authResponse = "Strategy: " +
            _folio.strategy +
            "\n" +
            "Service Level: " +
            _folio.serviceLevel +
            "\n" +
            "QEA permission: " +
            _perm.qeaAuth.toString() +
            "\n" +
            "MEA permission: " +
            _perm.meaAuth.toString() +
            "\n" +
            "SEA permission: " +
            _perm.seaAuth.toString() +
            "\n" +
            "TEA permission: " +
            _perm.teaAuth.toString() +
            "\n" +
            "MLEA permission: " +
            _perm.mleaAuth.toString() +
            "\n" +
            "RLEA permission: " +
            _perm.rleaAuth.toString();

        print(authResponse);

        //Retrieve Qea objects
        //Retrieve Robot Ladder object
        SingleRobot _ladder = qeaResponseBody.singleRobot;

        //Retrieve QEA advice
        QeaAdvice _qeaAdvice = qeaResponseBody.qeaAdvice;

        // Make sure to reference OUTPUT of FastAPI call
        qeaResponse = "Robot Name: " +
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
            "QEA Advice: " +
            "\n" +
            _qeaAdvice.advice;

        print(qeaResponse);
      }

      //Retrieve Mea object
      MeaAdvice _meaAdvice = meaResponseBody.meaAdvice;

      if (_meaAdvice == null) {
        meaResponse = "Problem with MEA POST response";
      } else {
        // Make sure to reference OUTPUT of FastAPI call
        meaResponse = "Agent: " +
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

        print(meaResponse);
      }

      //Retrieve Sea object
      SeaAdvice _seaAdvice = seaResponseBody.seaAdvice;

      if (_seaAdvice == null) {
        seaResponse = "Problem with SEA POST response";
      } else {
        // Make sure to reference OUTPUT of FastAPI call
        seaResponse = "Agent: " +
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

        print(seaResponse);
      }
    }
    esResponse =
        meaResponse +
            "\n" +
            seaResponse;

    print(esResponse);

    // if you want to return a String to _widget
    return esResponse;

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

  fetchQeaObj(String user) async {
    try {
      Qea qea = await qeaRepository.fetchQea(user);
      return qea;
    } catch (e) {
      print(e);
    }
  }

  fetchMeaObj(String user) async {
    try {
      Mea mea = await meaRepository.fetchMea(user);
      return mea;
    } catch (e) {
      print(e);
    }
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