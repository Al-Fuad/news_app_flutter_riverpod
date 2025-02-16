import 'package:news_app_flutter_riverpod/core/data/model/news_model.dart';

abstract class SearchResultRemoteDataSource {
  Future<List<NewsModel>> fetchNews(String? category, String search);
}
