import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluttertui_app/view/view_models/mea_page_view_model.dart';
import 'package:fluttertui_app/view/widgets/mea_list.dart';

class MeaWidget extends StatefulWidget {
  @override
  _MeaWidgetState createState() => _MeaWidgetState();
}

class _MeaWidgetState extends State<MeaWidget> {

  @override
  void initState() {
    super.initState();
    Provider.of<MeaListViewModel>(context, listen: false).fetchMeas();
  }

  void _filterQeas(String searchTerm) {
    Provider.of<MeaListViewModel>(context).search(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MeaListViewModel>(context);

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
                      Text("MEA Agent",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                      Text("meaAdvice",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Center(
                          child: CircularProgressIndicator()),
                      SizedBox(
                          height: MediaQuery.of(context).size.height - 310,
                          child: MeaList(meas: vm.meas))
                    ]),
              )),
        ]));
  }
}