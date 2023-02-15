import 'package:dartz/dartz.dart';

abstract class ILocalStorage {
  Future<Map<String, String>> readAll();

  Future<String> read(LocalStorageReadParams params);

  Future<Unit> deleteAll();

  Future<Unit> delete(LocalStorageDeleteParams params);

  Future<Unit> write(LocalStorageWriteParams params);
}

class LocalStorageReadParams {
  final String key;

  LocalStorageReadParams(this.key);
}

class LocalStorageDeleteParams {
  final String key;

  LocalStorageDeleteParams(this.key);
}

class LocalStorageWriteParams {
  final String key;
  final String value;

  LocalStorageWriteParams(this.key, this.value);
}
