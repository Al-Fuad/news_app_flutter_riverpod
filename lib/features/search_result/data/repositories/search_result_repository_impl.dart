import 'package:dartz/dartz.dart';
import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';
import 'package:news_app_flutter_riverpod/core/error/failures.dart';
import 'package:news_app_flutter_riverpod/features/search_result/data/datasources/search_result_remote_data_source.dart';
import 'package:news_app_flutter_riverpod/features/search_result/domain/repositories/search_result_repository.dart';

class SearchResultRepositoryImpl extends SearchResultRepository{
  SearchResultRemoteDataSource remoteDataSource;

  SearchResultRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<NewsEntity>>> getNews(String? category, String search) async {
    try {
      final newsList = await remoteDataSource.fetchNews(category, search);
      return Right(newsList);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

}