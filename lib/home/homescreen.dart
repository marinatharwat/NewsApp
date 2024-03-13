import 'dart:convert';
import 'package:http/http.dart' as http;
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
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child:
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                fetchSearchResults(_searchController.text);
                              },
                            ),
                          ),
                        ),
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