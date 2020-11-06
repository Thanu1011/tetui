
import 'package:fluttertui_app/models/authorisation.dart';
import 'package:fluttertui_app/repository/auth_repo.dart';

class AuthBloc {
  AuthRepository authRepository;

  AuthBloc() {
    authRepository = AuthRepository();
  }

  Future<List<Auth>> authBusinessLogic()  async {

    Auth authObject = await fetchAuthObj();

    List<Auth> authList = [];

    authList.add(authObject);

    return authList;

  }

  Future<Auth> fetchAuthObj() async {
    Auth auth = await authRepository.fetchAuth();
    return auth;
  }
}