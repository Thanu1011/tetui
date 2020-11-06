import 'package:flutter/material.dart';

import 'package:fluttertui_app/models/mea.dart';
import 'package:fluttertui_app/blocs/mea_bloc.dart';


class MeaListViewModel extends ChangeNotifier {
  List<MeaViewModel> meas = List<MeaViewModel>();
  List<MeaViewModel> allMeas = List<MeaViewModel>();

  Future<void> fetchMeas() async {

    MeaBloc _bloc = MeaBloc();

    final result = await _bloc.meaBusinessLogic();
    meas = result.map((mea) => MeaViewModel(mea: mea)).toList();
    allMeas = meas;
    notifyListeners();
  }

  void search(String searchTerm) {
    if (searchTerm.isEmpty) {
      meas = allMeas;
    } else {
      meas =
          allMeas.where((meas) => meas.mea.meaAdvice.agent.startsWith(searchTerm)).toList();
    }
    notifyListeners();
  }
}

class MeaViewModel {
  final Mea mea;

  MeaViewModel({this.mea});
}
