import 'package:bookly_app/Features/home/domain/entites/entities.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

// هنا من هدف اني اجلب البيانات مش اعمل اذا هو خطا اولا
// repo هو الي هيحدد اذا صح او خطا
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}

// هنا ينفذذ كل المطلوب منو في data remote
