import 'package:shared_preferences/shared_preferences.dart';

class BookmarkService {
  static const String _bookmarkedArticlesKey = 'bookmarked_articles';

  Future<void> saveBookmarkedArticles(Set<int> bookmarkedArticleIds) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<int> articleIdsList = bookmarkedArticleIds.toList();
    await pref.setStringList(
      _bookmarkedArticlesKey,
      articleIdsList.map((id) => id.toString()).toList(),
    );
  }

  Future<Set<int>> loadBookmarkedArticles() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? savedArticleIds = pref.getStringList(_bookmarkedArticlesKey);
    if (savedArticleIds != null) {
      return savedArticleIds.map((e) => int.parse(e)).toSet();
    }
    return {};
  }
}
