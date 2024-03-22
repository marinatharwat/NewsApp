import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:news/category/category_details.dart';
import 'package:news/category/category_frogment.dart';
import 'package:news/category/new_search.dart';
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
  List<String> searchResults = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void fetchSearchResults(String query) async {
    String url = 'https://newsapi.org/v2/everything?q=$query&apiKey=5f90715b5adf4ba694391e3f7479879f';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);        setState(() {
          final List<dynamic> articles = jsonData['articles'];
        });
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (error) {
      print('Error fetching search results: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: provider.isDarkMode()
              ? Image.asset(
            "assets/images/dark.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          )
              : Image.asset(
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
            actions: [
              // isIconClicked ? SearchBox() :
              IconButton(
                onPressed: () {
                  // isIconClicked = !isIconClicked;
                  setState(() {
                    showSearch(context: context, delegate: NewsSearch(),);
                  });
                },
                icon: const Icon(Icons.search),
              ),
            ],
            toolbarHeight: MediaQuery.of(context).size.height / 6,
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
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(
              onsideMenuItem: onSideMenuClick,
            ),
          ),
          body: selectedMenuItem == HomeDrawer.settings
              ? const SettingScreen()
              : selectedCategory == null
              ? CategoryFragment(
            onCategoryClick: onCategoryClick,
          )
              : CategoryDetails(category: selectedCategory!),
        ),
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
}