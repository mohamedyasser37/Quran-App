import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy/home/quran/sura_tittle.dart';

class QuranTab extends StatelessWidget {
final controller=ScrollController();

  List<String> SuraName=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {


    return Container(
      alignment: Alignment.center,
      child: Column(

        children: [


          Expanded(
              flex: 2,
              child: Image.asset('assets/images/quran_img.png')),
          Container(
            height: 10,
          ),
          Container(
            height: 2,
            color:  Theme.of(context).colorScheme.onSecondary,
          ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            'اسم السوره',
            style: TextStyle(fontSize: 26,
                fontWeight: FontWeight.bold,color:Theme.of(context).colorScheme.onSecondary ),
          ),
        ),


          Container(
            height: 2,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          Expanded(
            flex: 7,
            child: Scrollbar(controller: controller,
              radius: Radius.circular(14),isAlwaysShown: true,
              interactive: true,
              thickness: 10,
              showTrackOnHover: true,
              child: ListView.separated(
                controller: controller,
                separatorBuilder: (c,index){
                  return  Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    height: 1,
                    color:Theme.of(context).colorScheme.onSecondary,
                  );
                },
                  itemCount: SuraName.length,
                  itemBuilder: (c,index){
                return SuraTittle(SuraName[index],index
                )
                ;
              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(

                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: scrollUp,child: Icon(Icons.arrow_circle_up_outlined,
                  size: 34,color:Theme.of(context).colorScheme.onPrimary,),)),
          ),
        ],
      ),
    );
  }
  void scrollUp(){
   // double start=0;

    controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
