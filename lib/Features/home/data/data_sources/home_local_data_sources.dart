import 'package:bookly_app/Features/home/data/model/book_model/item.dart';
import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/network/api_base_helper.dart';

abstract class HomeLocalDataSource {
  List<BookEntity>fetchFeaturedBooks();

  List<BookEntity> fetchNewestBooks();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}
// ليش هنا ما في Future
//لان انا هكون حافظه هاذا البيانات مش هستنى تيجي