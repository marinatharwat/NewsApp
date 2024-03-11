import 'package:flutter/material.dart';
import 'package:news/category/category_details.dart';
import 'package:news/home/homescreen.dart';
import 'package:news/model/Category_model.dart';
import 'package:news/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
}

