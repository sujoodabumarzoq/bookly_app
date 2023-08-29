import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/core/errors/failur.dart';
import 'package:bookly_app/network/app_exception.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<AppException, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<AppException, List<BookEntity>>> fetchNewestBooks();
}
