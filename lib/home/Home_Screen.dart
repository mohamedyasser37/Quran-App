import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy/home/hadeth/hadeth_tab.dart';
import 'package:islamy/home/providers/my_provider.dart';
import 'package:islamy/home/quran/quran_tab.dart';
import 'package:islamy/home/radio/radio_tab.dart';
import 'package:islamy/home/sebha/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/home/setting/setting.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(

              image: AssetImage(pro.changeBackground()),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,
              color:Theme.of(context).colorScheme.onSecondary, ),),
        ),
        bottomNavigationBar: BottomNavigationBar(

          onTap: (newselectedIndex){
            setState(() {
              selectedIndex=newselectedIndex;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem( backgroundColor: Theme.of(context).colorScheme.primary,
                icon: ImageIcon(AssetImage('assets/images/quran2.png')),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem( backgroundColor: Theme.of(context).colorScheme.primary,
                icon: ImageIcon(AssetImage('assets/images/quran1.png')),
                label:AppLocalizations.of(context)!.ahadeth ),
            BottomNavigationBarItem( backgroundColor: Theme.of(context).colorScheme.primary,
                icon: ImageIcon(AssetImage('assets/images/sebha1.png')),
                label: AppLocalizations.of(context)!.tasbeh),
            BottomNavigationBarItem( backgroundColor: Theme.of(context).colorScheme.primary,
                icon: ImageIcon(AssetImage('assets/images/radio1.png')),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem( backgroundColor: Theme.of(context).colorScheme.primary,
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.setting),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    );


  }
  List<Widget> tabs=[QuranTab(),HadethTab(),SebhaTab(),RadioTab(),SettingTab()];
}
