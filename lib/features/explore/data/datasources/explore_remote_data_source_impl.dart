import 'package:news_app_flutter_riverpod/core/data/model/news_model.dart';
import 'package:news_app_flutter_riverpod/core/network/api_service.dart';
import 'package:news_app_flutter_riverpod/core/utils/constant.dart';
import 'package:news_app_flutter_riverpod/features/explore/data/datasources/explore_remote_data_source.dart';

class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  @override
  Future<List<NewsModel>> fetchNews(String? category) async {
    final response = await ApiService().getRequest(
      Constant.topHeadlinesEndpoint,
      query: {'category': category},
    );

    if (response.statusCode == 200) {
      return NewsModel.fromJsonList(response.data['articles']);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
