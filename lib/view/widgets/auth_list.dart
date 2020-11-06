import 'package:flutter/material.dart';

import 'package:fluttertui_app/view/view_models/auth_page_view_model.dart';

class AuthList extends StatelessWidget {
  final List<AuthViewModel> auths;

  AuthList({this.auths});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey[400]);
      },
      itemCount: auths.length,
      itemBuilder: (context, index) {
        final auth = auths[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),

          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${auth.auth.username}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500, )),
                Text("${auth.auth.portfolio.strategy}",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20,)),
              ]),
          trailing: Column(children: <Widget>[
            Text("${auth.auth.portfolio.serviceLevel}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500, )),
            Container(
              width: 75,
              height: 25,
              child: Text("-1.09%", style: TextStyle(color: Colors.white, )),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.red),
            )
          ]),
        );
      },
    );
  }
}
