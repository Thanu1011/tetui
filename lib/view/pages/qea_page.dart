


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluttertui_app/view/widgets/qea_widget.dart';
import 'package:fluttertui_app/view/view_models/qea_page_view_model.dart';
import 'package:fluttertui_app/view_bot/qea_widget.dart';

class QeaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider(
            create: (_) => QeaListViewModel(),
            child: QeaWidget())),
    floatingActionButton: FloatingActionButton(
      backgroundColor: const Color(0xFF90A4AE),
      child: Icon(Icons.android),
    onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) {
      return  QeaWidgt ();}));
    },
    ));
  }
}
