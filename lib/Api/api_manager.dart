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
  static Future<NewsResponse> getNewsBySourceId({String ?sourceId,String? searchKeyword}) async {
    Uri url = Uri.https(
        ApiConstant.baseUrl,
        ApiConstant.newsApi,
        {'apiKey': '5f90715b5adf4ba694391e3f7479879f',
          'sources': sourceId,
          'q': searchKeyword,
        }

    );

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }


}
