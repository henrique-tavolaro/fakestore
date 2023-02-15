import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/cache/local_storage/i_local_storage.dart';
import 'package:fakestore/app/core/cache/local_storage/local_storage.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/external/local_datasource/storage_datasource.dart';
import 'package:fakestore/app/infra/i_local_datasource/i_storage_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageMock extends Mock implements LocalStorage {}

class LocalStorageWriteParamsFake extends Fake
    implements LocalStorageWriteParams {}

class LocalStorageReadParamsFake extends Fake
    implements LocalStorageReadParams {}

class LocalStorageDeleteParamsFake extends Fake
    implements LocalStorageDeleteParams {}

void main() {
  final storage = LocalStorageMock();

  final dummyToken = 'token';

  late StorageDatasource sut;
  setUp(() {
    sut = StorageDatasource(storage);
    registerFallbackValue(LocalStorageWriteParamsFake());
    registerFallbackValue(LocalStorageReadParamsFake());
    registerFallbackValue(LocalStorageDeleteParamsFake());
  });

  group('save token', () {
    test('should save token in local storage', () async {
      when(() => storage.write(params: any(named: 'params')))
          .thenAnswer((_) async => unit);

      final result = await sut.saveToken(
        params: StorageSaveTokenParams(value: dummyToken),
      );

      expect(result, unit);
    });

    test('should return cache exception', () async {
      when(() => storage.write(params: any(named: 'params')))
          .thenThrow(CacheException(message: 'message'));

      expect(
          () async => await sut.saveToken(
                params: StorageSaveTokenParams(value: dummyToken),
              ),
          throwsA(isA<CacheException>()));
    });
  });

  group('get token', () {
    test('should get the token from storage', () async {
      when(() => storage.read(params: any(named: 'params')))
          .thenAnswer((_) async => dummyToken);

    final result = await sut.getToken();

    expect(result, dummyToken);

    });

    test('should return cache exception', () async {
      when(() => storage.read(params: any(named: 'params')))
          .thenThrow(CacheException(message: 'message'));

      expect(
              () async => await sut.getToken(),
          throwsA(isA<CacheException>()));
    });
  });

  group('delete token', () {
    test('should delete the token from storage', () async {
      when(() => storage.delete(params: any(named: 'params')))
          .thenAnswer((_) async => unit);

      final result = await sut.deleteToken();

      expect(result, unit);
    });

    test('should return cache exception', () async {
      when(() => storage.delete(params: any(named: 'params')))
          .thenThrow(CacheException(message: 'message'));

      expect(
              () async => await sut.deleteToken(),
          throwsA(isA<CacheException>()));
    });
  });
}
