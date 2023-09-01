import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/core/errors/failur.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
