import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
ThemeMode themeMode=ThemeMode.light;
  String Language='ar';

  void changeLanguage(String languageCode){
    Language=languageCode;
    notifyListeners();
  }
void changeTheme(ThemeMode theme){
  themeMode=theme;
  notifyListeners();
}
String changeBackground(){
    if(themeMode==ThemeMode.light){
      return 'assets/images/background.png';
    }
    return 'assets/images/bg_dark.png';
}

}