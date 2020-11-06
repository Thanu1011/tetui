import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


class OpsWidget extends StatefulWidget {
  @override
  _OpsWidgetState createState() => _OpsWidgetState();
}

class _OpsWidgetState extends State<OpsWidget> {

  Map items = {
    0: 'Updating Service Robot Ladders..',
    1: 'Updating Portfolios..',
    2: 'Generating Client Signals'
  };


  _fetchEntry(int index) async {

    await Future.delayed(Duration(milliseconds: 500));

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final title = 'AI Corp Operations';

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: this._fetchEntry(index),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator());
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          var opsInfo = snapshot.data;

                          return ListTile(
                            leading: Icon(Icons.build),
                            title: Text(opsInfo[index]),
                            subtitle: Text('info: ${opsInfo[index]}...'),
                          );
                        }
                    }
                  },
                );
              })),
    );
  }
}
