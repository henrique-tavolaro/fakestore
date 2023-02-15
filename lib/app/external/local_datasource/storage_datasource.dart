import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/cache/local_storage/i_local_storage.dart';
import 'package:fakestore/app/core/cache/local_storage/local_storage.dart';
import 'package:fakestore/app/core/constants/app_keys.dart';
import 'package:fakestore/app/infra/i_local_datasource/i_storage_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IStorageDatasource)
class StorageDatasource implements IStorageDatasource {
  final LocalStorage localStorage;

  StorageDatasource(this.localStorage);

  @override
  Future<Unit> deleteToken() async {
    try {
      await localStorage.delete(
        params: LocalStorageDeleteParams(key: AppKeys.token),
      );
      return unit;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<String> getToken() async {
    try {
      final token = await localStorage.read(
        params: LocalStorageReadParams(key: AppKeys.token),
      );
      return token;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Unit> saveToken({required StorageSaveTokenParams params}) async {
    try {
      await localStorage.write(
        params:
            LocalStorageWriteParams(key: AppKeys.token, value: params.value),
      );
      return unit;
    } catch (e) {
      throw e;
    }
  }
}
