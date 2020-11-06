import 'package:flutter/material.dart';

import 'package:fluttertui_app/models/authorisation.dart';
import 'package:fluttertui_app/models/mea.dart';
import 'package:fluttertui_app/models/qea.dart';
import 'package:fluttertui_app/models/sea.dart';

import 'package:fluttertui_app/blocs/auth_bloc.dart';
import 'package:fluttertui_app/blocs/mea_bloc.dart';
import 'package:fluttertui_app/blocs/qea_bloc.dart';
import 'package:fluttertui_app/blocs/sea_bloc.dart';

//The web service fetches the stocks from our custom server and then populates
//the Stock model, which is later returned to the caller as a Future<List<Stock>>.

class EsListViewModel extends ChangeNotifier {

  List<EsViewModel> ess = [];
  List<EsViewModel> allEss = [];

  Future<void> fetchEss() async {
    AuthBloc _blocAuth = AuthBloc();

    Auth resultAuth = await _blocAuth.fetchAuthObj();

    MeaBloc _blocMea = MeaBloc();

    Mea resultMea = await _blocMea.fetchMeaObj();

    QeaBloc _blocQea = QeaBloc();

    Qea resultQea = await _blocQea.fetchQeaObj();

    SeaBloc _blocSea = SeaBloc();

    Sea resultSea = await _blocSea.fetchSeaObj();

    EsViewModel essObj = EsViewModel(
        auth: resultAuth, mea: resultMea, qea: resultQea, sea: resultSea);


    ess.add(essObj);
    allEss = ess;

    notifyListeners();
  }

  void search(String searchTerm) {
    if (searchTerm.isEmpty) {
      ess = allEss;
    } else {
      ess = allEss
          .where((ess) => ess.auth.username.startsWith(searchTerm))
          .toList();
    }
    notifyListeners();
  }
}

class EsViewModel {
  final Auth auth;
  final Mea mea;
  final Qea qea;
  final Sea sea;

  EsViewModel({this.auth, this.mea, this.qea, this.sea});
}
