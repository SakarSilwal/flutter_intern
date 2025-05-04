class NewData {
  int id;
  String title;
  String category;
  String author;
  String publishedDate;
  int readTime;
  List<String> tags;
  String imageUrl;
  String snippet;
  String content;

  NewData({
    required this.id,
    required this.title,
    required this.category,
    required this.author,
    required this.publishedDate,
    required this.readTime,
    required this.tags,
    required this.imageUrl,
    required this.snippet,
    required this.content,
  });

  factory NewData.tojson(Map<String, dynamic> json) {
    return NewData(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      author: json['author'],
      publishedDate: json['publishedDate'],
      readTime: json['readTime'],
      tags: json['tags'],
      imageUrl: json['image_url'],
      snippet: json['snippet'],
      content: json['content'],
    );
  }
}
