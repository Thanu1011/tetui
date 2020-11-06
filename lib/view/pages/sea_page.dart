import 'package:flutter/material.dart';
import 'package:fluttertui_app/view_bot/sea_widget.dart';
import 'package:provider/provider.dart';

import 'package:fluttertui_app/view/widgets/sea_widget.dart';
import 'package:fluttertui_app/view/view_models/sea_page_view_model.dart';


class SeaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: ChangeNotifierProvider(
            create: (_) => SeaListViewModel(),
            child: SeaWidget())),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF90A4AE),
          child: Icon(Icons.android),
          onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  SeaWidgt ();}));
          },
        ));
  }
}

