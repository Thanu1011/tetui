import 'package:flutter/material.dart';

import 'package:fluttertui_app/view/view_models/mea_page_view_model.dart';
import 'package:expandable_text/expandable_text.dart';

class MeaList extends StatelessWidget {
  final List<MeaViewModel> meas;

  MeaList({this.meas});

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey[400]);
      },
      itemCount: meas.length,
      itemBuilder: (context, index) {
        final mea = meas[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Agent: ${mea.mea.meaAdvice.agent}\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        )),
                Text("Level 0: \n${mea.mea.meaAdvice.level0} \n",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,

                    )),
                Text("Level 1: \n${mea.mea.meaAdvice.level1} \n",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,

                    )),
                ExpandableText("Level 2: \n${mea.mea.meaAdvice.level2}\n",
                    maxLines: 1,
                    collapseText: 'Show less',
                    expandText:'Show More',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,

                    )),
                Text("Level 3: \n${mea.mea.meaAdvice.level3}\n",
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
                          text: '${mea.mea.meaAdvice.meaConfSell}',
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
                          text: '${mea.mea.meaAdvice.meaConfBuy}',
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
                          text: '${mea.mea.meaAdvice.meaConfHold}',
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
