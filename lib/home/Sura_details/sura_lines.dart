import 'package:flutter/material.dart';

class SuraLines extends StatelessWidget {
  String line;
  int num;
  SuraLines(this.line,this.num);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8,bottom:8 ,left: 8,right: 14),
        child: Text('$line{$num}',

        textDirection: TextDirection.rtl,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
      ),
      alignment: Alignment.center,
    );
  }
}
