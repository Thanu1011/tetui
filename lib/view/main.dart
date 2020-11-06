import 'package:flutter/material.dart';
//import 'package:device_preview/device_preview.dart';

import 'package:fluttertui_app/view/pages/intro_page.dart';
//import 'package:device_preview/device_preview.dart';

/* DevicePreview version
void main() {
  runApp(DevicePreview(
    builder: (context) => MyApp(),
  ));
}
*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //locale: DevicePreview.of(context).locale,
      //builder: DevicePreview.appBuilder,
        title: 'AICorp Expert System',
            theme: ThemeData(
              brightness:Brightness.dark,
              primarySwatch: Colors.indigo,
              fontFamily: 'Montserrat',
            ),
        debugShowCheckedModeBanner: false,
        home: IntroPage());
  }
}

