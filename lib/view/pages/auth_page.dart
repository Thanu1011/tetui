import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluttertui_app/view/widgets/auth_widget.dart';
import 'package:fluttertui_app/view/view_models/auth_page_view_model.dart';
import 'package:fluttertui_app/view/pages/es_page.dart';
import 'package:fluttertui_app/view_bot/custom_widget.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Center(
          child: ChangeNotifierProvider(
              create: (_) => AuthListViewModel(), child: AuthWidget())),
          SizedBox(height: 20),
      Align(
          alignment: (Alignment.bottomCenter),
          child: CustomButton(
            btnText: 'Next',
            onBtnPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EsPage();
              }));
            },
          )),
    ]));
  }
}
