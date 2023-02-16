import 'package:dartz/dartz.dart';

abstract class ILocalStorage {
  Future<Map<String, String>> readAll();

  Future<String> read({required LocalStorageReadParams params});

  Future<Unit> deleteAll();

  Future<Unit> delete({required LocalStorageDeleteParams params});

  Future<Unit> write({required LocalStorageWriteParams params});
}

class LocalStorageReadParams {
  final String key;

  LocalStorageReadParams({required this.key});
}

class LocalStorageDeleteParams {
  final String key;

  LocalStorageDeleteParams({required this.key});
}

class LocalStorageWriteParams {
  final String key;
  final String value;

  LocalStorageWriteParams({required this.key, required this.value});
}
