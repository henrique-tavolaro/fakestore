import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/infra/i_local_datasource/i_storage_datasource.dart';

abstract class IStorageRepository {
  Future<Either<Failure,String>> getToken();

  Future<Either<Failure,Unit>> deleteToken();

  Future<Either<Failure,Unit>> saveToken({required StorageSaveTokenParams params});
}
