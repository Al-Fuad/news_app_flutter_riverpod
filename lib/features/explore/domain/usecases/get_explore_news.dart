import 'package:dartz/dartz.dart';
import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';
import 'package:news_app_flutter_riverpod/core/error/failures.dart';
import 'package:news_app_flutter_riverpod/features/explore/domain/repositories/explore_repository.dart';

class GetExploreNews {
  final ExploreRepository repository;

  GetExploreNews(this.repository);
  Future<Either<Failure, List<NewsEntity>>> call(String? category) async {
    return await repository.getNews(category);
  }
}
