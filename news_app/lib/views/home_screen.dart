import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../controllers/news_controller.dart';
import '../widgets/shimmer_loader.dart';
import 'news_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => newsController.searchQuery.value = value,
              decoration: InputDecoration(
                hintText: 'Search News...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (newsController.isLoading.value) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (_, __) =>
                ShimmerLoader().animate().fadeIn(duration: 600.ms),
          );
        }
        return ListView.builder(
          itemCount: newsController.filteredArticles.length,
          itemBuilder: (_, index) {
            final article = newsController.filteredArticles[index];
            return Dismissible(
              key: Key(article.url),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white, size: 30),
              ),
              onDismissed: (direction) {
                newsController.articles.removeAt(index);
              },
              child: Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Hero(
                    tag: article.url,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        article.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    article.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(article.description,
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  onTap: () => Get.to(() => NewsDetailScreen(article: article)),
                ).animate().fade(duration: 400.ms).scale(),
              ),
            );
          },
        );
      }),
    );
  }
}
