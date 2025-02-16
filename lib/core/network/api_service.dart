import 'package:dio/dio.dart';
import 'package:news_app_flutter_riverpod/core/utils/constant.dart';

class ApiService {
  final Dio dio;

  ApiService({Dio? dio}) : dio = dio ?? Dio();

  // Function to make API requests
  Future<Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(
        '${Constant.baseUrl}$endpoint',
        queryParameters: {
          ...?query,
          'apiKey': Constant.apiKey,
        },
      );

      return response;
    } catch (e) {
      throw Exception('API request failed: $e');
    }
  }
}
