class Article {
  final int id;
  final String title;
  final String category;
  final String image_url;
  final String snippet;
  final String content;

  Article({
    required this.id,
    required this.title,
    required this.category,
    required this.image_url,
    required this.snippet,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      image_url: json['image_url'],
      snippet: json['snippet'],
      content: json['content'],
    );
  }

  toJson() {
    return {'id': id};
  }
}
