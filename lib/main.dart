import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/pages/article_detail_page.dart';
import 'package:news_app/pages/bookmark_page.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/pages/new_data.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        BookmarkPage.routeName:(context)=> const BookmarkPage(),
        },

      onGenerateRoute: (settings) {
        if (settings.name == '/second') {
          final article = settings.arguments as Article;
          return MaterialPageRoute(
            builder: (context) => ArticleDetailPage(article: article),
          );
        }
        return null;
      },
    );
  }
}
