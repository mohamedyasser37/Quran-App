import 'package:flutter/material.dart';
import 'package:islamy/home/Sura_details/sura_details_screen.dart';
import 'package:islamy/home/providers/my_provider.dart';
import 'package:islamy/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home/Home_Screen.dart';
import 'home/hadeth/hadeth_details_screen.dart';
import 'package:provider/provider.dart';
void main() {
runApp(ChangeNotifierProvider(
    create: (context)=>MyProvider(),
    child: myApp()));
}

class myApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(provider.Language),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(c)=>HomeScreen(),
        SuraDetailsScreen.routeName:(c)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(c)=>HadethDetailsScreen(),
      },
      theme:MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
    );
  }
}


