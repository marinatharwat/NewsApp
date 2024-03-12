import 'package:flutter/material.dart';
import 'package:news/model/Category_model.dart';
import 'package:news/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/app_confing_provider.dart';
import 'category_item.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryDM.getCategories();
  Function onCategoryClick;

  CategoryFragment({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(
                "Pick your category \n of interest",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium?.copyWith(color:provider.isDarkMode()?MyTheme.whiteColor:MyTheme.blackColor)
      ),
            ),
            const SizedBox(height: 5,),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: categoriesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      onCategoryClick(categoriesList[index]);
                    },
                    child: CategoryItem(
                      categoryDM: categoriesList[index],
                      index: index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
