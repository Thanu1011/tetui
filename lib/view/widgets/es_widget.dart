import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertui_app/view/pages/loading_page.dart';

import 'package:fluttertui_app/view/view_models/es_page_view_model.dart';
import 'package:fluttertui_app/view/widgets/es_list.dart';

class EsWidget extends StatefulWidget {
  @override
  _EsWidgetState createState() => _EsWidgetState();
}

class _EsWidgetState extends State<EsWidget> {



  @override
  void initState() {
    super.initState();
    Provider.of<EsListViewModel>(context, listen: false).fetchEss();
  }

  void _filterEss(String searchTerm) {
    Provider.of<EsListViewModel>(context).search(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<EsListViewModel>(context);

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
                      Text("Expert System Agent",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                      Text("Expert System Advice",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Center(
                          child: CircularProgressIndicator()),
                      SizedBox(
                          height: MediaQuery.of(context).size.height - 310,
                          child: EsList(ess: vm.ess))
                    ]),

              )),
        ]));
  }
}
