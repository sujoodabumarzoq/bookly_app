import 'package:bookly_app/Features/home/data/data_sources/home_local_data_sources.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failur.dart';
import 'package:bookly_app/network/app_exception.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;

  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<AppException, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books ;

      books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    }  catch (e) {
      return left(FetchDataException(e.toString()));
    }
  }
  @override
  Future<Either<AppException, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books ;

       books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
       books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } on Exception catch (e) {
      return left(FetchDataException());
    }
  }
}
//بعمل تنفيذ للميثود الموجود
//بعمل تنفيذ ل remote&local dats
// domain لا يعتمد data layer
//يعني هنا مهمتها انها تجمع بين remote & local
