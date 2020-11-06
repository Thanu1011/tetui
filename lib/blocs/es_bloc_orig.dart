import 'package:fluttertui_app/models/authorisation.dart';
import 'package:fluttertui_app/models/qea.dart';
import 'package:fluttertui_app/models/mea.dart';
import 'package:fluttertui_app/models/sea.dart';

import 'package:fluttertui_app/repository/auth_repo.dart';
import 'package:fluttertui_app/repository/qea_repo.dart';
import 'package:fluttertui_app/repository/mea_repo.dart';
import 'package:fluttertui_app/repository/sea_repo.dart';

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
    authResponseBody = await _fetchAuthObj();
    qeaResponseBody = await _fetchQeaObj();
    meaResponseBody = await _fetchMeaObj();
    seaResponseBody = await _fetchSeaObj();
  }

  Future<Auth> _fetchAuthObj() async {
    Auth auth = await authRepository.fetchAuth();
    return auth;
  }

  Future<Mea> _fetchMeaObj() async {
    Mea mea = await meaRepository.fetchMea();
    return mea;
  }

  Future<Qea> _fetchQeaObj() async {
    Qea qea = await qeaRepository.fetchQea();
    return qea;
  }

  Future<Sea> _fetchSeaObj() async {
    Sea sea = await seaRepository.fetchSea();
    return sea;
  }
}

