import 'package:dartz/dartz.dart';
import 'package:news_app_flutter_riverpod/core/error/failures.dart';
import 'package:news_app_flutter_riverpod/features/home/data/datasources/home_remote_data_source.dart';
import 'package:news_app_flutter_riverpod/features/home/domain/entities/home_entity.dart';
import 'package:news_app_flutter_riverpod/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, HomeEntity>> getNews() async {
    try {
      final topNewsList = await remoteDataSource.fetchTopNews();
      final topTechList = await remoteDataSource.fetchTechNews();
      return Right(
        HomeEntity(
          technews: topTechList,
          topNews: topNewsList,
        ),
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
