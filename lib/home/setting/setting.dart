import 'package:flutter/material.dart';
import 'package:islamy/home/providers/my_provider.dart';
import 'package:islamy/home/setting/show_language_bottom_sheet.dart';
import 'package:islamy/home/setting/show_theme_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Text(AppLocalizations.of(context)!.language,
            style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              ShowLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18)
                  ,color: Theme.of(context).colorScheme.onPrimary),
              child:
              Text(pro.Language=='en'?'English':'العربيه',
                style: TextStyle(fontSize: 24,color: Theme.of(context).colorScheme.onBackground)
            ),),
          ),
          SizedBox(height: 30,),
          Text(AppLocalizations.of(context)!.theme,
            style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              ShowThemeBottomSheet(context);

            },
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18)
                  ,color: Theme.of(context).colorScheme.onPrimary),
              child:

              Text(
                  pro.Language=='en'?
                  pro.themeMode==ThemeMode.light?'Light':'Dark': pro.themeMode==ThemeMode.light?'فاتح':'داكن',
                  style: TextStyle(fontSize: 24,color: Theme.of(context).colorScheme.onBackground)
              ),),
          ),
        ],
      ),
    );
  }
  void   ShowLanguageBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (c){
      return ShowLanguage();
    });


  }
  void ShowThemeBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (c){
      return ShowTheme();
    });
  }

}
