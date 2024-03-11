import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Api/api_constant.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
// GET https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

class ApiManager {
  static Future<SourceResponse?>getSources(String categoryId)async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.sourcesApi,
        {'apiKey': '5f90715b5adf4ba694391e3f7479879f',
          'category': categoryId
        });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }


  // https://newsapi.org/v2/everything?q=bitcoin&apiKey=5f90715b5adf4ba694391e3f7479879f
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(
        ApiConstant.baseUrl,
        ApiConstant.newsApi,
        {'apiKey': '5f90715b5adf4ba694391e3f7479879f', 'sources': sourceId});

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }


  void searchNews(String query) async {
    try {
      var newsResponse = await ApiManager.getNewsBySourceId(query);

      if (newsResponse != null) {
        print('News found: ${newsResponse.articles}');
      } else {
        print('No news found.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  Future<void> fetchHeadlines() async {
    const String apiKey = '5f90715b5adf4ba694391e3f7479879f';
    const String languageCode = 'ar';

    final String url = 'https://newsapi.org/v2/top-headlines?country=us&language=$languageCode&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
      } else {
        print('Failed to load headlines: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching headlines: $error');
    }
  }
}
