import 'package:news_app_flutter_riverpod/core/network/api_service.dart';
import 'package:news_app_flutter_riverpod/core/utils/constant.dart';
import 'package:news_app_flutter_riverpod/features/home/data/datasources/home_remote_data_source.dart';
import 'package:news_app_flutter_riverpod/core/data/model/news_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDatasource {

  @override
  Future<List<NewsModel>> fetchTopNews() async {
    final response =
        await ApiService().getRequest(Constant.topHeadlinesEndpoint, query: {'country': 'us'});

    if (response.statusCode == 200) {
      return NewsModel.fromJsonList(response.data['articles']);
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Future<List<NewsModel>> fetchTechNews() async {
    final response = await ApiService().getRequest(
      Constant.topHeadlinesEndpoint,
      query: {'category': 'technology'},
    );

    if (response.statusCode == 200) {
      return NewsModel.fromJsonList(response.data['articles']);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
