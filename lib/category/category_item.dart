import 'package:flutter/material.dart';
import 'package:news/model/Category_model.dart';
class CategoryItem extends StatelessWidget {
  CategoryDM  categoryDM;
  int index;
   CategoryItem({super.key, required this.categoryDM,required this.index,

   });

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      color: categoryDM.color,
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(15),
          topRight:  const Radius.circular(15),
        bottomLeft:  Radius.circular(
          index%2 == 0?20:0
        ) ,
        bottomRight: Radius.circular(
            index%2 ==0?0:20
        ) ,
      )
    ),
    child: Column(
      children: [
        Image.asset(categoryDM.imagePath,
        height:MediaQuery.of(context).size.height*0.15,
        ),
        Text(categoryDM.title,
        style: Theme.of(context).textTheme.titleLarge
        )
      ],
    ),

    );
  }
}
