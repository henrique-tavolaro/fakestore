

import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/cache/local_storage/i_local_storage.dart';
import 'package:fakestore/app/core/constants/app_texts.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ILocalStorage)
class LocalStorage extends ILocalStorage {

  final storage = new FlutterSecureStorage();

  @override
  Future<Unit> delete({required LocalStorageDeleteParams params}) async {
    try {
      await storage.delete(key: params.key);
      return unit;
    } on PlatformException catch (e) {
      throw CacheException(message: e.message ?? AppTexts.errorDeletingStorageKey);
    }
  }

  @override
  Future<Unit> deleteAll() async  {
    try {
      await storage.deleteAll();
      return unit;
    } on PlatformException catch (e) {
      throw CacheException(message: e.message ?? AppTexts.errorDeletingAllStorageKeys);
    }
  }

  @override
  Future<String> read({required LocalStorageReadParams params}) async {
    try {
      final value = await storage.read(key: params.key);
      if(value != null){
        return value;
      }
      throw CacheException(message: AppTexts.keyNotFound);
    } on PlatformException catch (e) {
      throw CacheException(message: e.message ?? AppTexts.errorReadingStorageKey);
    }
  }

  @override
  Future<Map<String, String>> readAll() async {
    try {
      return await storage.readAll();
    } on PlatformException catch (e) {
      throw CacheException(message: e.message ?? AppTexts.errorReadingAllStorageKeys);
    }
  }

  @override
  Future<Unit> write({required LocalStorageWriteParams params}) async {
    try {
      await storage.write(key: params.key, value: params.value);
      return unit;
    } on PlatformException catch (e) {
      throw CacheException(message: e.message ?? AppTexts.errorWritingStorage);

    }
  }

}