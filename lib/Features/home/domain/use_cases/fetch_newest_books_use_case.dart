import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/network/app_exception.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failur.dart';
import '../../../../core/use_case/noParam_usecase.dart';
import '../entites/entities.dart';

class FetchFeaturedNewUsaCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedNewUsaCase(this.homeRepo);

  @override
  Future<Either<AppException, List<BookEntity>>> call([NoParam? param]) {
    return homeRepo.fetchNewestBooks();
  }
}

class NoParam {}
