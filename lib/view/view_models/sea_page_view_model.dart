import 'package:flutter/material.dart';

import 'package:fluttertui_app/models/sea.dart';
import 'package:fluttertui_app/blocs/sea_bloc.dart';


class SeaListViewModel extends ChangeNotifier {
  List<SeaViewModel> seas = List<SeaViewModel>();
  List<SeaViewModel> allSeas = List<SeaViewModel>();

  Future<void> fetchSeas() async {

    SeaBloc _bloc = SeaBloc();

    final result = await _bloc.seaBusinessLogic();
    seas = result.map((sea) => SeaViewModel(sea: sea)).toList();
    allSeas = seas;
    notifyListeners();
  }

  void search(String searchTerm) {
    if (searchTerm.isEmpty) {
      seas = allSeas;
    } else {
      seas =
          allSeas.where((seas) => seas.sea.seaAdvice.agent.startsWith(searchTerm)).toList();
    }
    notifyListeners();
  }
}

class SeaViewModel {
  final Sea sea;

  SeaViewModel({this.sea});
}