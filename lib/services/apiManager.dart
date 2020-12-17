import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/strings.dart';
import 'package:news_app/models/NewsInfo.dart';

// ignore: camel_case_types
class API_MANAGER {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Strings.News_Url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
