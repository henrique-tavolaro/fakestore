import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/domain/i_repositories/i_storage_repository.dart';
import 'package:fakestore/app/external/local_datasource/storage_datasource.dart';
import 'package:fakestore/app/infra/i_local_datasource/i_storage_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IStorageRepository)
class StorageRepository implements IStorageRepository {
  final StorageDatasource datasource;

  StorageRepository(this.datasource);

  @override
  Future<Either<Failure, Unit>> deleteToken() async {
    try {
      await datasource.deleteToken();
      return right(unit);
    } on CacheException catch (e) {
      return left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      return right(await datasource.getToken());
    } on CacheException catch (e) {
      return left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveToken(
      {required StorageSaveTokenParams params}) async {
    try {
      await datasource.saveToken(
        params: params,
      );

      return right(unit);
    } on CacheException catch (e) {
      return left(CacheFailure(message: e.message));
    }
  }
}
