import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final double imgHeight;
  HeroImage({this.imgHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('lib/assets/invest.png'),
      width: MediaQuery.of(context).size.width,
      height: imgHeight,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  CustomButton({this.btnText,this.onBtnPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              btnText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold)),
            SizedBox( width: 0),
          ],
        ),

      ),

      onPressed: onBtnPressed,
        color: Colors.indigo[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
