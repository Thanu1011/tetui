import 'package:flutter/material.dart';



class Selectable extends StatelessWidget {

  final String title;
  final bool isForList;

  Selectable ({this.title, this.isForList = true });

  Widget _buildItem(BuildContext context) {

    return Container(
      height: 100,
      child: Padding (padding: EdgeInsets.all(10),
        child:Text(title),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:60.0,
        child: isForList ?
        Padding(padding: EdgeInsets.all(0.0),
          child: _buildItem(context),
        )
            :
        Card(
            color: Colors.grey,
            child:Stack(
              children: [
                _buildItem(context),
                Align(
                  alignment: Alignment.centerRight,
                  child:Icon(Icons.arrow_drop_down),
                )
              ],
            )
        )


    );
  }
}