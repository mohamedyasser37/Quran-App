import 'package:flutter/material.dart';
import 'package:islamy/home/Sura_details/sura_args.dart';
import 'package:islamy/home/Sura_details/sura_details_screen.dart';

class SuraTittle extends StatelessWidget {
  String tittle;
  int index;
  SuraTittle(this.tittle,this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: tittle, index: index)
        );

      },
      child: Container(
        padding: EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Text(tittle,style: TextStyle(fontSize: 26,
            color: Theme.of(context).colorScheme.onSecondary),),
      ),
    );
  }
}
