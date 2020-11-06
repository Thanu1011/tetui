import 'package:flutter/material.dart';
import 'package:fluttertui_app/view/pages/loading_page.dart';
import 'package:fluttertui_app/models/authorisation.dart';
import 'package:fluttertui_app/blocs/auth_bloc.dart';

//The web service fetches the stocks from our custom server and then populates
//the Stock model, which is later returned to the caller as a Future<List<Stock>>.

class AuthListViewModel extends ChangeNotifier {
  List<AuthViewModel> auths = List<AuthViewModel>();
  List<AuthViewModel> allAuths = List<AuthViewModel>();

  Future<void> fetchAuths() async {
    //final regUser = 'GeeVee';

    AuthBloc _bloc = AuthBloc();

    final result = await _bloc.authBusinessLogic();
    auths = result.map((auth) => AuthViewModel(auth: auth)).toList();
    allAuths = auths;
    notifyListeners();
  }

  void search(String searchTerm) {
    if (searchTerm.isEmpty) {
      auths = allAuths;
    } else {
      auths = allAuths
          .where((auths) => auths.auth.username.startsWith(searchTerm))
          .toList();

      // By default, show a loading spinner


    }
    notifyListeners();
  }



}

class AuthViewModel {
  final Auth auth;

  AuthViewModel({this.auth});



}
