import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failur.dart';
import 'package:bookly_app/network/app_exception.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_case/noParam_usecase.dart';
import '../entites/entities.dart';

class FetchFeaturedBooksUsaCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUsaCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) {
    return homeRepo.fetchFeaturedBooks();
  }
}

class NoParam {}
