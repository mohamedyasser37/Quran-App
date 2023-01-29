import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/home/hadeth/hadeth_class.dart';

import 'ahadeth_tittle.dart';
import 'hadeth_class.dart';

class HadethTab extends StatefulWidget {

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth>allhadethList=[];

  @override
  Widget build(BuildContext context) {
    if(allhadethList.isEmpty)
      readHadeth();

    return Container(
     child: Column(
       children: [
         Expanded(
             flex: 2,
             child: Image.asset('assets/images/hadeth_img.png')),
         SizedBox(
           height: 10,
         ),
         Container(
           height: 2,
           color: Theme.of(context).colorScheme.onSecondary,
         ),
         Padding(
           padding: const EdgeInsets.all(4.0),
           child: Text(
             'الاحاديث',
             style: TextStyle(fontSize: 26,
                 fontWeight: FontWeight.bold,color:Theme.of(context).colorScheme.onSecondary ),
           ),
         ),
         Container(
           height: 2,
           color: Theme.of(context).colorScheme.onSecondary,
         ),

         Expanded(
           flex: 5,
           child: Scrollbar(
             radius: Radius.circular(14),
             interactive: true,
             thickness: 6,
             showTrackOnHover: true,
             child: ListView.separated(   separatorBuilder: (c,index){
               return Container(
                 margin: EdgeInsets.symmetric(horizontal: 60),
                 height: 1,
                 width: double.infinity,
                 color: Theme.of(context).colorScheme.primary,
               );
             },
                 itemCount: allhadethList.length,
                 itemBuilder: (c,index){
               return AhadethTittle(allhadethList[index]);
             }),
           ),
         )
       ],
     ),
    );
  }

  void readHadeth()async{
    List<Hadeth>hadethList=[];
   String allHadeth=await rootBundle.loadString('assets/files/ahadeth .txt');
   List<String>allHadethContent=allHadeth.split('#');
   for(int i=0;i<allHadethContent.length;i++){
     String singleHadeth=allHadethContent[i].trim();
     int indexOfFirstLine=singleHadeth.indexOf('\n');
     String tittle=singleHadeth.substring(0,indexOfFirstLine);
     String content=singleHadeth.substring(indexOfFirstLine+1);
     Hadeth h=Hadeth(tittle, content);
     hadethList.add(h);

   }
   allhadethList=hadethList;
   setState(() {
   });


  }
}
