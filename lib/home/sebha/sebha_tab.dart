import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
int index=0;

int counter=0;
double angle=0.0;
List<String>tasbeeh=["سبحان الله ","الحمد لله ","الله اكبر "];

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity ,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: height*0.45,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
              Positioned(child: Image.asset('assets/images/head_sebha.png',
                fit: BoxFit.cover,width: width*0.22,height: height*0.14,),
              left:width*0.45,),
              Positioned(
                //height: height*0.28,
                top: height*0.1,
              //  left: width*0.22,
                child: GestureDetector(
                  onTap: OnClick,
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset('assets/images/all_sebha_img.png')),
                ),
              ),
            ],),
          ),
          //SizedBox(height: 10,),
        Text('عدد التسبيحات',style: TextStyle(fontSize: 24,color: Theme.of(context).colorScheme.onSecondary),),
          SizedBox(height: 12,),

          Container(
            alignment: Alignment.center,
            width: 70,
            height: 80,
            decoration: BoxDecoration(
                color:  Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(25)),
            child: Text(counter.toString(),style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),



         ),
          SizedBox(height: 25,),
          Container(

            alignment: Alignment.center,
            width: 140,
            height: 50,
            decoration: BoxDecoration(
                color:  Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(25)),
            child: Text(tasbeeh[index],
              style: TextStyle(color:  Theme.of(context).colorScheme.onBackground
                ,fontSize: 28),),



          ),
    ],)
    );
  }

  OnClick(){
    setState(() {
      counter++;
      angle--;

      if(counter==34){
        index++;
        counter=0;
      }
      if(index>tasbeeh.length-1){
        index=0;
      }
    });


  }
}
