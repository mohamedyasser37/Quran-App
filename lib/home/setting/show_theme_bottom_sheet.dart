import 'package:flutter/material.dart';
import 'package:islamy/home/providers/my_provider.dart';
import 'package:provider/provider.dart';
class ShowTheme extends StatelessWidget {
  const ShowTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(children: [
        InkWell(
            onTap: (){
              pro.changeTheme(ThemeMode.light);
            },
            child: languageItem(context,'Light',pro.themeMode==ThemeMode.light)),
        SizedBox(height: 30,),
        InkWell(
          onTap: (){
            pro.changeTheme(ThemeMode.dark);
          },
            child: languageItem(context,'Dark',pro.themeMode==ThemeMode.dark)),
      ],),
    );
  }
  Widget languageItem(BuildContext context,String text,bool isSelected)=> Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Text(text,style: TextStyle(fontSize: 24,
      color: isSelected?Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.secondary),),
  Icon(Icons.done, color: isSelected?Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.secondary),
  ],);
}
