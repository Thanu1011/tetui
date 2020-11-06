
import 'dart:async';

import 'package:fluttertui_app/models/sea.dart';
import 'package:fluttertui_app/repository/sea_repo.dart';

class SeaBloc {
  SeaRepository seaRepository;

  SeaBloc() {
    seaRepository = SeaRepository();
  }

  Future<List<Sea>> seaBusinessLogic()  async {
    Sea seaObject = await fetchSeaObj();

    List<Sea> seaList = [];

    seaList.add(seaObject);

    return seaList;
  }

  Future<Sea> fetchSeaObj() async {
    Sea sea = await seaRepository.fetchSea();
    return sea;
  }
}
