import 'package:flutter/material.dart';

import 'package:fluttertui_app/view/view_models/es_page_view_model.dart';
import 'package:fluttertui_app/view/pages/qea_page.dart';
import 'package:fluttertui_app/view/pages/mea_page.dart';
import 'package:fluttertui_app/view/pages/sea_page.dart';

class EsList extends StatelessWidget {
  final List<EsViewModel> ess;

  EsList({this.ess});

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey[400]);
      },
      itemCount: ess.length,
      itemBuilder: (context, index) {
        final es = ess[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Strategy: ',
                          style: TextStyle(
                              color: Colors.grey[300],
                              fontFamily: 'Montserrat',
                              fontSize: 18)),
                      TextSpan(
                          text: '${es.auth.portfolio.strategy}',
                          style: TextStyle(
                              color: Colors.red[500],
                              fontSize: 18,
                              fontFamily: 'Montserrat')),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Service Level: ',
                          style: TextStyle(
                              color: Colors.grey[300],

                              fontSize: 18)),
                      TextSpan(
                          text: '${es.auth.portfolio.serviceLevel}\n',
                          style: TextStyle(
                              color: Colors.red[500],
                              fontSize: 18,
                              )),
                    ],
                  ),
                ),
                (RaisedButton(
                    child: Text("Agent 1- QEA",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            )),
                    color: Colors.grey[500],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return QeaPage();
                          // navigate to desired screen
                        }),
                      );
                    })),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Level 0 Advice:\n',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: "${es.qea.qeaAdvice.level0}\n",
                          style: TextStyle(
                            color: Colors.indigo[300],
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
                Text(
                    "Overall Confidence- 0.78 \nConfidence on Sell- 0.75 \nConfidence on Buy- 0.81 \nConfidence on Hold- 0\n",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                        )),

                (RaisedButton(
                    child: Text("Agent 2- MEA",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            )),
                    color: Colors.grey[500],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return MeaPage();
                          // navigate to desired screen
                        }),
                      );
                    })),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Level 0 Advice:\n',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: "${es.mea.meaAdvice.level0}\n",
                          style: TextStyle(
                            color: Colors.indigo[300],
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),

                Text(
                    "Confidence on Sell- ${es.mea.meaAdvice.meaConfSell}\nConfidence on Buy- ${es.mea.meaAdvice.meaConfBuy}\nConfidence on Sell- ${es.mea.meaAdvice.meaConfHold}\n",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                        )),
                (RaisedButton(
                    child: Text("Agent 3- SEA",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            )),
                    color: Colors.grey[500],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return SeaPage();
                          // navigate to desired screen
                        }),
                      );
                    })),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Level 0 Advice:\n',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: "${es.sea.seaAdvice.level0}\n",
                          style: TextStyle(
                            color: Colors.indigo[300],
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
                Text(
                    "Confidence on Sell- ${es.sea.seaAdvice.seaConfSell} \nConfidence on Buy- ${es.sea.seaAdvice.seaConfBuy}\nConfidence on Sell- ${es.sea.seaAdvice.seaConfHold}\n",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                        )),
              ]),
        );
      },
    );
  }
}
