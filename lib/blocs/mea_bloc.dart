
import 'package:fluttertui_app/models/mea.dart';
import 'package:fluttertui_app/repository/mea_repo.dart';

class MeaBloc {
  MeaRepository meaRepository;

  MeaBloc() {
    meaRepository = MeaRepository();
  }

  Future<List<Mea>> meaBusinessLogic()  async {
    Mea meaObject = await fetchMeaObj();

    List<Mea> meaList = [];

    meaList.add(meaObject);

    return meaList;
  }

  Future<Mea> fetchMeaObj() async {
    Mea mea = await meaRepository.fetchMea();
    return mea;
  }
}
