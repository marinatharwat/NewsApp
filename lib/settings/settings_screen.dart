import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';
import 'package:news/provider/app_confing_provider.dart';
import 'package:news/settings/bottom_Theme_sheet.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Text(
            'Theme',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color:  provider.isDarkMode()?MyTheme.whiteColor:MyTheme.blackColor )
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                ShowThemeBottomSheet();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: provider.isDarkMode()?
                    MyTheme.greenColor:   MyTheme.greenColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Dark',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color:  provider.isDarkMode()?MyTheme.whiteColor:MyTheme.blackColor )
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 40,
                      )
                    ],
                  ),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void ShowThemeBottomSheet(){
    showModalBottomSheet(context: context, builder: (context)=>const BottomThemeSheet());
  }
}
