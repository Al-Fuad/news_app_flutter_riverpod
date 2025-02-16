import 'package:news_app_flutter_riverpod/core/data/model/news_model.dart';

abstract class HomeRemoteDatasource {
  Future<List<NewsModel>> fetchTopNews();
  Future<List<NewsModel>> fetchTechNews();
}
