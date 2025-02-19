import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news_article.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;

  NewsDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Column(
        children: [
          Hero(
            tag: article.url,
            child: Image.network(article.imageUrl)
                .animate()
                .fadeIn(duration: 600.ms)
                .scale(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(article.description, style: TextStyle(fontSize: 16)),
          ),
          ElevatedButton(
            onPressed: () async {
              final Uri url = Uri.parse(article.url);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            child: Text("Read Full Article"),
          ).animate().scale(duration: 500.ms),
        ],
      ),
    );
  }
}
