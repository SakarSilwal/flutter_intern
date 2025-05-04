import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/articles_model.dart';

class ArticleStorage {
  static const String _key = 'articles';


  Future<List<Article>> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/articles.json');
    List<dynamic> jsonList = json.decode(jsonString);

    return jsonList.map((e) => Article.fromJson(e)).toList();
  }
}
