import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';
class CategoryDM{
  String id;
  String title;
  String imagePath;
  Color color;
  CategoryDM({required this.id,
    required this.title,
    required this.imagePath,
  required this.color
  });
  static List<CategoryDM> getCategories(){
    return [
      CategoryDM(id: 'sports', title: 'Sports', imagePath: 'assets/images/ball.png', color: MyTheme.redDark),
      CategoryDM(id: 'general', title: 'general', imagePath: 'assets/images/Politics.png', color: MyTheme.politics),
      CategoryDM(id: 'health', title: 'Health', imagePath: 'assets/images/health.png', color: MyTheme.health),
      CategoryDM(id: 'business', title: 'Business', imagePath: 'assets/images/bussines.png', color: MyTheme.business),
      CategoryDM(id: 'entertainment', title: 'Entertainment', imagePath: 'assets/images/environment.png', color: MyTheme.primaryLight),
      CategoryDM(id: 'science', title: 'Science', imagePath: 'assets/images/science.png', color: MyTheme.science),


    ];
  }
}