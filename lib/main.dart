
import 'package:flutter/material.dart';
import 'package:news/home/homescreen.dart';
import 'package:news/my_theme.dart';
import 'package:news/provider/app_confing_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child:  MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider= Provider.of<AppConfigProvider>(context);
    initSharedPreferences();
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName ,
        routes: {
        HomeScreen.routeName:(context) =>  HomeScreen(),
          // CategoryDetails.routeName: (context) => CategoryDetails(category: ),
        },
      theme: MyTheme.lightMode,
        );
  }
  Future<void> initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    var isDark = prefs.getBool("isDark");
    if (isDark == true) {
      provider.ChangeTheme(ThemeMode.dark);
    } else if (isDark == false) {
      provider.ChangeTheme(ThemeMode.light);
    }
  }

}

