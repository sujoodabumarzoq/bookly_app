import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failur.dart';
import '../entites/entities.dart';

class FetchFeaturedBooksUsaCase{
  final HomeRepo homeRepo ;

  FetchFeaturedBooksUsaCase(this.homeRepo);
  Future<Either<Failure,List<BookEntity>>> fetchFeaturedBooks(){
   return homeRepo.fetchFeaturedBooks();
  }

}