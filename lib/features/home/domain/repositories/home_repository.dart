import 'package:dartz/dartz.dart';
import 'package:news_app_flutter_riverpod/core/error/failures.dart';
import 'package:news_app_flutter_riverpod/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> getNews();
}
