


import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:async';

import 'package:flutter/material.dart';


class Loading extends StatelessWidget {

@override
Widget build (BuildContext context) {
  return Container (
    color: Colors.indigo[900],
    child:Center(
      child: SpinKitRotatingCircle(
        color:Colors.indigo,
        size:50.0,
      ),
    ),
  );
}
}