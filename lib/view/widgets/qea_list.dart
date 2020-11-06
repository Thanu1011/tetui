import 'package:flutter/material.dart';

import 'package:fluttertui_app/view/view_models/qea_page_view_model.dart';
import 'package:expandable_text/expandable_text.dart';

class QeaList extends StatelessWidget {
  final List<QeaViewModel> qeas;

  QeaList({this.qeas});

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey[400]);
      },
      itemCount: qeas.length,
      itemBuilder: (context, index) {
        final qea = qeas[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Robot: ${qea.qea.singleRobot.name}\n",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                Text("Current Holding: ${qea.qea.singleRobot.holding.fund}\n",
                    style: TextStyle(color: Colors.grey[300], fontSize: 18)),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Recommendation: ',
                          style:
                              TextStyle(color: Colors.grey[300], fontSize: 18)),
                      TextSpan(
                          text: '${qea.qea.qeaAdvice.advice} \n',
                          style:
                              TextStyle(color: Colors.red[300], fontSize: 18))
                    ],
                  ),
                ),
                Text("Level 0: \n${qea.qea.qeaAdvice.level0} \n",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    )),
                Text("Level 1: \n${qea.qea.qeaAdvice.level1} \n",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    )),
                ExpandableText("Level 2: \n${qea.qea.qeaAdvice.level2} \n",
                    maxLines: 1,
                    collapseText: 'Show less',
                    expandText: 'Show More',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    )),
                ExpandableText("Level 3: \n${qea.qea.qeaAdvice.level3}\n",
                    maxLines: 1,
                    collapseText: 'Show less',
                    expandText: 'Show More',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    )),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '\nOverall Confidence-',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16)),
                  TextSpan(
                      text: '0.78',
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
                      text: 'Confidence on Sell-',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16)),
                  TextSpan(
                      text: '0.75',
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
                      text: '0.81',
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
                      text: '0',
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
