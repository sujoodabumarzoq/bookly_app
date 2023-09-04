

import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/core/errors/failur.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookEntity>>> fetechSearchedBooks(String string);
}