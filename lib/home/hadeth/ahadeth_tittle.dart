import 'package:flutter/material.dart';
import 'package:islamy/home/Sura_details/sura_args.dart';
import 'package:islamy/home/Sura_details/sura_details_screen.dart';
import 'package:islamy/home/hadeth/hadeth_class.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'hadeth_details_screen.dart';

class AhadethTittle extends StatelessWidget {
  Hadeth hadeth;

  AhadethTittle(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadeth);
      },
      child: Container(
        padding: EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Text(
          hadeth.tittle,
          style: TextStyle(fontSize: 26,color:Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    );
  }
}
