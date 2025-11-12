import 'package:get/get.dart';
import '../models/news_article.dart';
import '../services/api_service.dart';

class NewsController extends GetxController {
  var articles = <NewsArticle>[].obs;
  var isLoading = true.obs;
  var searchQuery = ''.obs;

  @override 
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      articles.value = await ApiService.fetchNews();
    } finally {
      isLoading(false);
    }
  }

  List<NewsArticle> get filteredArticles {
    if (searchQuery.value.isEmpty) return articles;
    return articles.where((article) => article.title.toLowerCase().contains(searchQuery.value.toLowerCase())).toList();
  }
}
