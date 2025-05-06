import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/article_service.dart';
import '../models/articles_model.dart';
import 'article_detail_page.dart';
import '../services/bookmark_service.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> _articles = [];
  Set<int> _bookmarkedArticleIds = {};
  final BookmarkService _bookmarkService = BookmarkService();
  //
  @override
  void initState() {
    super.initState();
    loadArticles();
    loadBookmarkedArticles();
  }

  //load bookmarked articles from sp
  Future<void> loadBookmarkedArticles() async {
    Set<int> bookmarkedArticles =
        await _bookmarkService.loadBookmarkedArticles();
    setState(() {
      _bookmarkedArticleIds = bookmarkedArticles;
    });
  }

  //save bookmarked arti to sp
  Future<void> saveBookmarkedArticles() async {
    await _bookmarkService.saveBookmarkedArticles(_bookmarkedArticleIds);
  }

  Future<void> loadArticles() async {
    var articleStorage = ArticleStorage();
    List<Article> articles = await articleStorage.loadJson();

    setState(() {
      _articles = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmarks),
            onPressed: () {
              Navigator.pushNamed(context, '/bookmarks');
            },
          ),
        ],
        title: Text('Articles'),
      ),
      body:
          _articles.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _articles.length,
                itemBuilder: (context, index) {
                  final article = _articles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/second',
                        arguments: article,
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            article.image_url != null
                                ? Hero(
                                  tag: article.id,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      article.image_url,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                                : Icon(Icons.image_not_supported, size: 80),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          article.title,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          _bookmarkedArticleIds.contains(
                                                article.id,
                                              )
                                              ? Icons.bookmark
                                              : Icons.bookmark_border,
                                          color:
                                              _bookmarkedArticleIds.contains(
                                                    article.id,
                                                  )
                                                  ? Colors.red
                                                  : Colors.grey,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            if (_bookmarkedArticleIds.contains(
                                              article.id,
                                            )) {
                                              _bookmarkedArticleIds.remove(
                                                article.id,
                                              );
                                            } else {
                                              _bookmarkedArticleIds.add(
                                                article.id,
                                              );
                                            }
                                          });

                                          await saveBookmarkedArticles();

                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                _bookmarkedArticleIds.contains(
                                                      article.id,
                                                    )
                                                    ? 'Article bookedmarked!'
                                                    : 'Article removed from bookmarks!',
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    article.snippet,
                                    style: TextStyle(color: Colors.grey[600]),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Chip(
                                    label: Text(
                                      article.category,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
