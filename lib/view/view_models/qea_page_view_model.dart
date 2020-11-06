import 'package:flutter/material.dart';

import 'package:fluttertui_app/models/qea.dart';
import 'package:fluttertui_app/blocs/qea_bloc.dart';


class QeaListViewModel extends ChangeNotifier {
  List<QeaViewModel> qeas = List<QeaViewModel>();
  List<QeaViewModel> allQeas = List<QeaViewModel>();

  Future<void> fetchQeas() async {

    QeaBloc _bloc = QeaBloc();

    final result = await _bloc.qeaBusinessLogic();
    qeas = result.map((qea) => QeaViewModel(qea: qea)).toList();
    allQeas = qeas;
    notifyListeners();
  }

  void search(String searchTerm) {
    if (searchTerm.isEmpty) {
      qeas = allQeas;
    } else {
      qeas =
          allQeas.where((qeas) => qeas.qea.qeaAdvice.agent.startsWith(searchTerm)).toList();
    }
    notifyListeners();
  }
}

class QeaViewModel {
  final Qea qea;

  QeaViewModel({this.qea});


}
