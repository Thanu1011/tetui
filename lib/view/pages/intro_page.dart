import 'package:flutter/material.dart';
import 'package:fluttertui_app/view_bot/custom_widget.dart';
import 'package:fluttertui_app/view/pages/login_page.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
        Align(alignment:Alignment(0.0,0.00), child: HeroImage(
              imgHeight: MediaQuery
                  .of(context)
                  .size
                  .height * 0.7,
            )),
            Align(alignment:Alignment(-.50,0.00),
                child: Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Hybrid Engagement',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                   )),

                      ],
                    ))),

        Align(alignment:(Alignment.bottomCenter),
            child: CustomButton(
      btnText: 'Getting Started', onBtnPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return   Login ();
          })
      );
    },
    )
        )],
        ));
  }
}
