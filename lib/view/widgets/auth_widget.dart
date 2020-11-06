import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluttertui_app/view/view_models/auth_page_view_model.dart';
import 'package:fluttertui_app/view/widgets/auth_list.dart';

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}
bool _saving = false;

class _AuthWidgetState extends State<AuthWidget> {

  @override
  void initState() {
    super.initState();
    Provider.of<AuthListViewModel>(context, listen: false).fetchAuths();
  }

  void _filterAuths(String searchTerm) {
    Provider.of<AuthListViewModel>(context).search(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthListViewModel>(context);

    return Scaffold(
        body: Stack(children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("Authorisation",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold, )),
                      Text("Auth",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 30,
                              fontWeight: FontWeight.bold, )),

                      Center(
                          child: CircularProgressIndicator()),

                      SizedBox(
                          height: MediaQuery.of(context).size.height - 310,
                          child: AuthList(auths: vm.auths))
                    ]),
              )),

        ])
    );

  }

}