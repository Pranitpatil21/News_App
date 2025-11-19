import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart'; 

class ApiService {
  static const String apiKey = '9f2028d44fa442b9942b56fb4e7ba3e8';
  static const String baseUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
  
  static Future<List<NewsArticle>> fetchNews() async {
    final response = await http.get(Uri.parse(baseUrl));    

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];
      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
