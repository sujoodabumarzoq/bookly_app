import 'package:bookly_app/core/errors/failur.dart';
import 'package:bookly_app/network/app_exception.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<AppException, Type>> call();
}
