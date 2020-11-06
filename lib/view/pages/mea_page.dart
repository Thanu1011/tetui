
import 'package:flutter/material.dart';
import 'package:fluttertui_app/view_bot/mea_widget.dart';
import 'package:provider/provider.dart';

import 'package:fluttertui_app/view/widgets/mea_widget.dart';
import 'package:fluttertui_app/view/view_models/mea_page_view_model.dart';

class MeaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: ChangeNotifierProvider(
            create: (_) => MeaListViewModel(),
            child: MeaWidget())),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF90A4AE),
          child: Icon(Icons.android),
          onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  MeaWidgt ();}));
          },
        ));
  }
}

