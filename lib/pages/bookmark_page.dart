import 'package:flutter/material.dart';
import '../models/articles_model.dart';
import '../services/article_service.dart';
import '../services/bookmark_service.dart';
import 'article_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookmarkPage extends StatefulWidget {
  static const routeName = '/bookmarks';

  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<Article> _allArticle = [];
  Set<int> _bookmarkedArticleIds = {};
  final BookmarkService _bookmarkService = BookmarkService();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final articleStorage = ArticleStorage();
    final article = await articleStorage.loadJson();
    final bookmarkedIds = await _bookmarkService.loadBookmarkedArticles();

    setState(() {
      _allArticle = article;
      _bookmarkedArticleIds = bookmarkedIds;
    });
  }

  Future<void> toggleBookmark(int articleId) async {
    setState(() {
      _bookmarkedArticleIds.remove(articleId);
    });

    await _bookmarkService.saveBookmarkedArticles(_bookmarkedArticleIds);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Removed form bookmarks')));
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkedArticles =
        _allArticle
            .where((article) => _bookmarkedArticleIds.contains(article.id))
            .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarked Articles')),
      body:
          bookmarkedArticles.isEmpty
              ? const Center(child: Text('No bookmarks yet!'))
              : ListView.builder(
                itemCount: bookmarkedArticles.length,
                itemBuilder: (context, index) {
                  final article = bookmarkedArticles[index];

                  return Card(
                    elevation: 6,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: article.image_url,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => CircularProgressIndicator(),
                          errorWidget:
                              (context, url, error) => Icon(Icons.error),
                        ),
                      ),

                      title: Text(article.title),
                      subtitle: Text(article.snippet),

                      trailing: IconButton(
                        icon: const Icon(
                          Icons.bookmark_remove,
                          color: Colors.red,
                        ),
                        onPressed: () => toggleBookmark(article.id),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ArticleDetailPage.routeName,
                          arguments: article,
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}
