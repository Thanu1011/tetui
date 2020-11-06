import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fluttertui_app/view/widgets/es_widget.dart';
import 'package:fluttertui_app/view/view_models/es_page_view_model.dart';

class EsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ChangeNotifierProvider(
            create: (_) => EsListViewModel(),
            child: EsWidget()));
  }
}
