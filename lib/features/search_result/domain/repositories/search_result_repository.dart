import 'package:dartz/dartz.dart';
import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';
import 'package:news_app_flutter_riverpod/core/error/failures.dart';

abstract class SearchResultRepository {
  Future<Either<Failure, List<NewsEntity>>> getNews(String? category, String search);
}