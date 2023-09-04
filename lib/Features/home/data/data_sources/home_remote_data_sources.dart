import 'package:bookly_app/Features/home/data/model/book_model/item.dart';
import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/funcation/save_books.dart';
import 'package:bookly_app/network/api_base_helper.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}

// هنا من هدف اني اجلب البيانات مش اعمل اذا هو خطا اولا
// repo هو الي هيحدد اذا صح او خطا
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiBaseHelper apiBaseHelper;

  HomeRemoteDataSourceImpl(this.apiBaseHelper);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiBaseHelper
        .get("volumes?q=computer science&startIndex=${pageNumber * 10}");

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiBaseHelper.get(
        "volumes?Filtering=free-ebooks&Sorting=newest &q=computer science=${pageNumber * 10}");

    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewsBox);

    return books;
  }

  List<BookEntity> getBooksList(data) {
    List<BookEntity> books = [];
    for (var bookmap in data["items"]) {
      books.add(Item.fromJson(bookmap));
    }
    return books;
  }
}
