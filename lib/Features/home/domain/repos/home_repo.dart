import 'package:bookly_app/Features/home/domain/entites/entities.dart';

abstract class HomeRepo{
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}