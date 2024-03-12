import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/app_confing_provider.dart';

class BottomThemeSheet extends StatefulWidget {
  const BottomThemeSheet({Key? key}) : super(key: key);

  @override
  State<BottomThemeSheet> createState() => _BottomThemeSheetState();
}

class _BottomThemeSheetState extends State<BottomThemeSheet> {
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color:
          provider.isDarkMode()
              ? MyTheme.blackDark
              : MyTheme.whiteColor,
          borderRadius: BorderRadius.circular(10),


      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: (){
                    provider.ChangeTheme(ThemeMode.dark);
                  },
                  child:provider.isDarkMode()?
                  getSelectedItemWidget('Dark'):
                  getUnSelectedItemWidget('Dark')
              ),
              const SizedBox(height: 40),
              GestureDetector(
                  onTap: (){
                    provider.ChangeTheme(ThemeMode.light);
                  },
                  child:provider.appTheme==ThemeMode.light?
                  getSelectedItemWidget('Light'):
                  getUnSelectedItemWidget('Light')
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget getSelectedItemWidget(String text){
    var provider= Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(color:provider.isDarkMode()?MyTheme.whiteColor:MyTheme.blackColor ,  fontWeight: FontWeight.bold)

        ),
         Icon(
          Icons.check,
          size: 40,
          color: provider.isDarkMode()?MyTheme.greenColor:MyTheme.greenColor ,),

      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    var provider= Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text ,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color:provider.isDarkMode()?MyTheme.whiteColor:MyTheme.blackColor ,  fontWeight: FontWeight.bold)
        ),
      ],
    );
  }

}
