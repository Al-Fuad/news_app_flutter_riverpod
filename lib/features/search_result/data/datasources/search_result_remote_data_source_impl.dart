import 'package:news_app_flutter_riverpod/core/data/model/news_model.dart';
import 'package:news_app_flutter_riverpod/core/network/api_service.dart';
import 'package:news_app_flutter_riverpod/core/utils/constant.dart';
import 'package:news_app_flutter_riverpod/features/search_result/data/datasources/search_result_remote_data_source.dart';

class SearchResultRemoteDataSourceImpl implements SearchResultRemoteDataSource {
  @override
  Future<List<NewsModel>> fetchNews(String? category, String search) async {
    final response = await ApiService().getRequest(
      Constant.topHeadlinesEndpoint,
      query: {
        'q': search,
        'sortBy': 'publishedAt',
        'category': category,
      },
    );
    if (response.statusCode == 200) {
      return NewsModel.fromJsonList(response.data['articles']);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
