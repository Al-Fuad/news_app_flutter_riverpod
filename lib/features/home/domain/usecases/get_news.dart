import 'package:dartz/dartz.dart';
import 'package:news_app_flutter_riverpod/core/error/failures.dart';
import 'package:news_app_flutter_riverpod/features/home/domain/entities/home_entity.dart';
import 'package:news_app_flutter_riverpod/features/home/domain/repositories/home_repository.dart';

class GetNews {
  final HomeRepository repository;

  GetNews(this.repository);

  Future<Either<Failure, HomeEntity>> call() async {
    return await repository.getNews();
  }
}
