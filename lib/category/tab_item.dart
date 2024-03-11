import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/my_theme.dart';
 class  TabItem extends StatelessWidget {
   Source source;
   bool  isSelected;
   TabItem({super.key, required this.isSelected,required this.source});
   @override
   Widget build(BuildContext context) {
     return

       Container(
       padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
          margin: const EdgeInsets.only(top: 15),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
           color: isSelected ? MyTheme.greenColor: Colors.transparent  ,
           border:  Border.all(
           width: 2,
           color: MyTheme.greenColor
         )
       ),
       child: Text(source.name??'',
       style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color:isSelected ? MyTheme.whiteColor : MyTheme.greenColor,
         fontSize: 18

       )

       ),
     );
   }
 }
 