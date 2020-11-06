import 'dart:async';

import 'package:fluttertui_app/repo_bot/auth_repository.dart';
import 'package:fluttertui_app/models/authorisation.dart';

class OeaBloc {
  AuthRepository authRepository;

  OeaBloc() {
    authRepository = AuthRepository();
  }

  fetchAuthObj(String user) async {
    try {
      Auth auth = await authRepository.fetchAuth(user);
      return auth;

    } catch (e) {
      print(e);
    }
  }
}