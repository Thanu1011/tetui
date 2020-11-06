import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluttertui_app/view/view_models/qea_page_view_model.dart';
import 'package:fluttertui_app/view/widgets/qea_list.dart';

class QeaWidget extends StatefulWidget {
  @override
  _QeaWidgetState createState() => _QeaWidgetState();
}

class _QeaWidgetState extends State<QeaWidget> {

  @override
  void initState() {
    super.initState();
    Provider.of<QeaListViewModel>(context, listen: false).fetchQeas();
  }

  void _filterQeas(String searchTerm) {
    Provider.of<QeaListViewModel>(context).search(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<QeaListViewModel>(context);

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
                      Text("QEA Agent",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                      Text("qeaAdvice",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Center(
                          child: CircularProgressIndicator()),
                      SizedBox(
                          height: MediaQuery.of(context).size.height - 310,
                          child: QeaList(qeas: vm.qeas))
                    ]),
              )),
        ]));
  }
}