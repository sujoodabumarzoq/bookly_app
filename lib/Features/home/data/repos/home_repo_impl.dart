import 'package:bookly_app/Features/home/data/data_sources/home_local_data_sources.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failur.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;

  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var bookslist = homeLocalDataSource.fetchFeaturedBooks();
      if (bookslist.isNotEmpty) {
        return right(bookslist);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } on Exception catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var bookslist = homeLocalDataSource.fetchNewestBooks();
      if (bookslist.isNotEmpty) {
        return right(bookslist);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } on Exception catch (e) {
      return left(Failure());
    }
  }
}
