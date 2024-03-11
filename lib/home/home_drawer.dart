import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;

  final Function onsideMenuItem;

  const HomeDrawer({Key? key, required this.onsideMenuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: MyTheme.greenColor,
            child: Center(
              child: Text(
                "News App !",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: InkWell(
              onTap: () {
                onsideMenuItem(categories);
              },
              child: const Row(
                children: [
                  Icon(Icons.menu_outlined, size: 30),
                  SizedBox(width: 10),
                  Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: InkWell(
              onTap: () {
                onsideMenuItem(settings);
              },
              child: const Row(
                children: [
                  Icon(Icons.settings_rounded),
                  SizedBox(width: 10),
                  Text(
                    "Settings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}