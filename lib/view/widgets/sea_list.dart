import 'package:flutter/material.dart';

import 'package:fluttertui_app/view/view_models/sea_page_view_model.dart';


import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_read_more_text/flutter_read_more_text.dart';
import 'package:expandable_text/expandable_text.dart';

class SeaList extends StatelessWidget {
  final List<SeaViewModel> seas;

  SeaList({this.seas});

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey[400]);
      },
      itemCount: seas.length,
      itemBuilder: (context, index) {
        final sea = seas[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Agent: ${sea.sea.seaAdvice.agent}\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,

                        fontWeight: FontWeight.w500)),
                Text("Level 0: \n${sea.sea.seaAdvice.level0} \n",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    )),
                Text("Level 1: \n${sea.sea.seaAdvice.level1} \n",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    )),
                Text("Level 2: ${sea.sea.seaAdvice.level2}",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    )),
                Text("Level 3: ${sea.sea.seaAdvice.level3} \n",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    )),
                Text('Confidence Level:\n',
                    style:
                    TextStyle(color: Colors.red[500], fontSize: 18)),

                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Confidence on Sell-',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16)),
                      TextSpan(
                          text: '${sea.sea.seaAdvice.seaConfSell}',
                          style: TextStyle(
                            color: Colors.green[500],
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Confidence on Buy-',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16)),
                      TextSpan(
                          text: '${sea.sea.seaAdvice.seaConfBuy}',
                          style: TextStyle(
                            color: Colors.green[500],
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Confidence on Hold-',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16)),
                      TextSpan(
                          text: '${sea.sea.seaAdvice.seaConfHold}',
                          style: TextStyle(
                            color: Colors.red[500],
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
              ]),
        );
      },
    );
  }
}
