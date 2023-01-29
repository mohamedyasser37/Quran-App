import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/home/hadeth/hadeth_class.dart';
import 'package:islamy/home/providers/my_provider.dart';
import 'package:provider/provider.dart';
class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth_details';

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    Hadeth args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(pro.changeBackground()),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(

          title: Text(args.tittle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,
    color:Theme.of(context).colorScheme.onSecondary),
        ),),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Scrollbar(
            radius: Radius.circular(14),
            interactive: true,
            thickness: 6,
            showTrackOnHover: true,
            child: Card(
              elevation: 12,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                args.content,
                style: TextStyle(fontSize: 22,color:Theme.of(context).colorScheme.secondary),
                textDirection: TextDirection.rtl,
              ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
