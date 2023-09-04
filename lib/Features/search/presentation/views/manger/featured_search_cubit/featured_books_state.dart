import 'package:bookly_app/Features/home/domain/entites/entities.dart';

abstract class FeaturedSearchBooksState {}

class FeaturedSearchBooksInitial extends FeaturedSearchBooksState {}

class FeaturedSearchBooksPaginationLoading extends FeaturedSearchBooksState {}

class FeaturedSearchBooksLoading extends FeaturedSearchBooksState {}

class FeaturedSearchBooksFailure extends FeaturedSearchBooksState {
  final String errMessage;

  FeaturedSearchBooksFailure(this.errMessage);
}

class FeaturedSearchBooksSucces extends FeaturedSearchBooksState {
  final List<BookEntity> books;

  FeaturedSearchBooksSucces(this.books);
}

class FeaturedSearchBooksPaginationFailure extends FeaturedSearchBooksState {
  final String errMessage;

  FeaturedSearchBooksPaginationFailure(this.errMessage);
}
