import 'package:fluttertui_app/models/authorisation.dart';
import 'package:fluttertui_app/networking_bot/apiProvider.dart';

import 'dart:async';


class AuthRepository {
  ApiProvider _provider = ApiProvider();

  Future<Auth> fetchAuth(String userName) async {
    const route = "/fastapi_auth/";

    // INPUT into AUTH is Username
    String usr = "GeeVee";

    Map<String, dynamic> response = await _provider.get(route, usr);

    return Auth.fromJson(response);
  }
}
