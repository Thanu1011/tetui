

import 'package:fluttertui_app/models/qea.dart';
import 'package:fluttertui_app/repository/qea_repo.dart';

class QeaBloc {
  QeaRepository qeaRepository;

  QeaBloc() {
    qeaRepository = QeaRepository();
  }

  Future<List<Qea>> qeaBusinessLogic()  async {
    Qea qeaObject = await fetchQeaObj();

    List<Qea> qeaList = [];

    qeaList.add(qeaObject);

    return qeaList;
  }

  Future<Qea> fetchQeaObj() async {
    Qea qea = await qeaRepository.fetchQea();
    return qea;
  }
}