import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/home/Sura_details/sura_args.dart';
import 'package:islamy/home/Sura_details/sura_lines.dart';
import 'package:islamy/home/providers/my_provider.dart';
import 'package:provider/provider.dart';
class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'Sura_Details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    SuraDetailsArgs? args=ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
   if(verses.isEmpty)
    readFile(args.index+1);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(pro.changeBackground()),
                fit: BoxFit.fill)
        ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text(args.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,
              color:Theme.of(context).colorScheme.secondary),
             )
        ),
        body:


        verses.isEmpty?
            Center(child: CircularProgressIndicator(),):
        Card(
          elevation: 12,
          margin: EdgeInsets.symmetric(horizontal: 12,vertical: 24),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
          child: Scrollbar(
            radius: Radius.circular(14),
           interactive: true,
            thickness: 6,
            showTrackOnHover: true,

            child: ListView.separated(

              separatorBuilder: (c,index){
                return Container(
                height: 1,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                );
            },
                itemCount: verses.length,
                itemBuilder: (c,index){
              return SuraLines(verses[index],index) ;

            }),
          ),
        ),
      ),
    );
  }

  void readFile(int fileEndex)async{
    String fileContent=await rootBundle.loadString('assets/files/$fileEndex.txt');
    List<String>lines=fileContent.trim().split('\n');
    setState(() {
      verses=lines;
    });
   
  }
}
