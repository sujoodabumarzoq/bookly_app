
import 'package:bookly_app/Features/home/data/model/book_model/item.dart';
import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/core/errors/failur.dart';
import 'package:bookly_app/network/api_base_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiBaseHelper apiBaseHelper;

  SearchRepoImpl(this.apiBaseHelper);

  @override
  Future<Either<Failure, List<BookEntity>>> fetechSearchedBooks(
      String string) async {
    try {
      var data = await apiBaseHelper.get(
          'volumes?Filtering=free-ebooks&q=$string',);

      List<BookEntity> books = [];

      for (var bookmap in data["items"]) {
        books.add(Item.fromJson(bookmap));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
