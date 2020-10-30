import 'dart:convert';

import 'package:news_app/data/models/api_result_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/res/strings.dart';

abstract class ArticleRepository {
  Future<List<Articles>> getArticles();
}

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<List<Articles>> getArticles() async {
    var response = await http.get(AppStrings.cricArticleUrl);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Articles> articles = ApiResultModel.fromJson(data).articles;
      return articles;
    } else {
      throw Exception();
    }
  }
}
