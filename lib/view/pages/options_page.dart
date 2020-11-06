

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertui_app/view/view_models/Selectable.dart';
import 'package:direct_select/direct_select.dart';
import 'package:fluttertui_app/view_bot/custom_widget.dart';

import 'package:fluttertui_app/view/pages/auth_page.dart';


class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  int index1 = 0, index2 = 0, index3 = 0;

  final elements1 = [
    'High Growth',
    'Growth',
    'Balanced',
  ];

  final elements2 = [
    'Platinum - Quarter',
    'Gold - Biannual',
    'Silver - Annual',
  ];

  final elements3 = [
    'R01 -Alternatives',
    'R02 - Equities Australia - All',
    'R03 - Equities Australia - Large',
    'R04 - Equities Australia - Mid / Small',
    'R05 - Equities World - All',
    'R06 - Equities World - Large',
    'R07 - Fixed Income - Bonds - Australia',
    'R08 - Fixed Income - Bonds - World',
    'R09 - Fixed Income - Bonds - Diversified - World',
    'R10 - Listed Property',
    'R11 - Listed Infrastructure',
    'R12 - Cash Robot',
    'R13',
    'R14',
    'R15',
  ];

  List _buildItem1() {
    return elements1
        .map((e) => Selectable(
      title: e,
    ))
        .toList();
  }

  List _buildItem2() {
    return elements2
        .map((e) => Selectable(
      title: e,
    ))
        .toList();
  }

  List _buildItem3() {
    return elements3
        .map((e) => Selectable(
      title: e,
    ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        title: Text('Select your Portfolio', style: TextStyle(fontSize: 30, color: Colors.white,),),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:const EdgeInsets.only(left: 10.0, top: 20.0),
                child: Text(
                  'Select your Service Level',
                  style: TextStyle(  fontSize: 20, color: Colors.grey[500], fontWeight: FontWeight.bold,),
                ),
              ),
              DirectSelect(
                items: _buildItem1(),

                onSelectedItemChanged: (index) {
                  setState(() {
                    index1 = index;
                  });
                },
                itemExtent: 60.0,
                child: Selectable(
                  title: elements1[index1],
                  isForList: false,
                ),
                mode: DirectSelectMode.tap,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                child: Text(
                  'Select your Strategy',
                  style: TextStyle(fontSize: 20, color: Colors.grey[500], fontWeight: FontWeight.bold, ),
                ),
              ),
              DirectSelect(
                items: _buildItem2(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    index2 = index;
                  });
                },
                itemExtent: 60.0,
                child: Selectable(
                  title: elements2[index2],
                  isForList: false,
                ),
                mode: DirectSelectMode.tap,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                child: Text(
                  'Select your Robot',
                  style: TextStyle(fontSize: 20, color: Colors.grey[500], fontWeight: FontWeight.bold,),
                ),
              ),
              DirectSelect(
                items: _buildItem3(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    index3 = index;
                  });
                },
                itemExtent: 60.0,
                child: Selectable(
                  title: elements3[index3],
                  isForList: false,
                ),
                mode: DirectSelectMode.tap,
              ),
              SizedBox(height: 20),

              CustomButton(
                btnText: 'OK',
                onBtnPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return   AuthPage();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}