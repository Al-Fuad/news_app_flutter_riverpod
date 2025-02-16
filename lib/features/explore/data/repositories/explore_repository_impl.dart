import 'package:dartz/dartz.dart';
import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';
import 'package:news_app_flutter_riverpod/core/error/failures.dart';
import 'package:news_app_flutter_riverpod/features/explore/data/datasources/explore_remote_data_source.dart';
import 'package:news_app_flutter_riverpod/features/explore/domain/repositories/explore_repository.dart';

class ExploreRepositoryImpl extends ExploreRepository {
  final ExploreRemoteDataSource remoteDataSource;

  ExploreRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<NewsEntity>>> getNews(String? category) async {
    try {
      final newsList = await remoteDataSource.fetchNews(category);
      return Right(newsList);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
