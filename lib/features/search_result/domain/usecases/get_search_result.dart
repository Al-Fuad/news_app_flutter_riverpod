import 'package:dartz/dartz.dart';
import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';
import 'package:news_app_flutter_riverpod/core/error/failures.dart';
import 'package:news_app_flutter_riverpod/features/search_result/domain/repositories/search_result_repository.dart';

class GetSearchResult {
  final SearchResultRepository repository;

  GetSearchResult(this.repository);
  Future<Either<Failure, List<NewsEntity>>> call(String? category, String search) async {
    return await repository.getNews(category, search);
  }
}
