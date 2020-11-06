import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluttertui_app/view/view_models/sea_page_view_model.dart';
import 'package:fluttertui_app/view/widgets/sea_list.dart';

class SeaWidget extends StatefulWidget {
  @override
  _SeaWidgetState createState() => _SeaWidgetState();
}

class _SeaWidgetState extends State<SeaWidget> {

  @override
  void initState() {
    super.initState();
    Provider.of<SeaListViewModel>(context, listen: false).fetchSeas();
  }

  void _filterSeas(String searchTerm) {
    Provider.of<SeaListViewModel>(context).search(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SeaListViewModel>(context);

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
                      Text("SEA Agent",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                      Text("seaAdvice",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Center(
                          child: CircularProgressIndicator()),
                      SizedBox(
                          height: MediaQuery.of(context).size.height - 310,
                          child: SeaList(seas: vm.seas))
                    ]),
              )),
        ]));
  }
}