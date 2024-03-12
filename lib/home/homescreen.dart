import 'package:flutter/material.dart';
import 'package:news/Api/api_manager.dart';
import 'package:news/category/category_details.dart';
import 'package:news/category/category_frogment.dart';
import 'package:news/home/home_drawer.dart';
import 'package:news/model/Category_model.dart';
import 'package:news/my_theme.dart';
import 'package:news/provider/app_confing_provider.dart';
import 'package:news/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_Screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = '';
  @override

  void updateSearchText(String text) {
    setState(() {
      searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child:    provider.isDarkMode()?
      Image.asset(
            "assets/images/dark.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ):
          Image.asset(
            "assets/images/splash.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: MediaQuery.of(context).size.height /6,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          selectedMenuItem == HomeDrawer.settings
                              ? 'Setting'
                              : selectedCategory == null
                              ? 'News App'
                              : selectedCategory!.id,
                          style: Theme.of(context).textTheme.titleLarge,),
                      ),],),

                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: updateSearchText,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          ),
                        ),
                      ),
                      IconButton(
                        icon:  Icon(Icons.search),
                        onPressed: () {
                          searchNews(searchText);


                        },
                      ),
                    ],
                  ),

                ],
              ),
            ),
            drawer: Drawer(
              child: HomeDrawer(onsideMenuItem: onSideMenuClick,

              ),
            ),
            body: selectedMenuItem == HomeDrawer.settings
                ? const SettingScreen()
                : selectedCategory == null
                    ? CategoryFragment(
                        onCategoryClick: onCategoryClick,
                      )
                    : CategoryDetails(category: selectedCategory!))
      ],
    );
  }

  CategoryDM? selectedCategory;

  void onCategoryClick(CategoryDM newSelectedCategory) {
    setState(() {
      selectedCategory = newSelectedCategory;
    });
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onSideMenuClick(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
  void searchNews(String query) async {
    try {
      var sourceResponse = await ApiManager.getNewsBySourceId(query);
    } catch (e) {
      // التعامل مع أي خطأ يحدث أثناء البحث
      print('Error searching news: $e');
    }
  }
}
