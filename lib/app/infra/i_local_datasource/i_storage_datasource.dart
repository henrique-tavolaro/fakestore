import 'package:dartz/dartz.dart';

abstract class IStorageDatasource {
  Future<String> getToken();

  Future<Unit> deleteToken();

  Future<Unit> saveToken({required StorageSaveTokenParams params});
}

class StorageSaveTokenParams {
  final String value;

  StorageSaveTokenParams({required this.value});
}

