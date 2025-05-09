import 'package:flutter/material.dart';
import '../models/articles_model.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article-detail';
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: article.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: (
                 CachedNetworkImage(
                  imageUrl: article.image_url,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  placeholder: (context,url)=>CircularProgressIndicator(),
                  errorWidget: (context, url, error)=>Icon(Icons.image_not_supported,size:80,),
                 )
                  )),
            ),
            const SizedBox(height: 16),
            Text(
              article.title,
              //
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(article.content, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
