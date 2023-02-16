import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/external/local_datasource/storage_datasource.dart';
import 'package:fakestore/app/infra/i_local_datasource/i_storage_datasource.dart';
import 'package:fakestore/app/infra/repositories/storage_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../external/datasource/local_datasource/fakes/fakes.dart';

class StorageDatasourceMock extends Mock implements StorageDatasource {}

void main() {
  final datasource = StorageDatasourceMock();

  final dummyToken = 'token';

  late StorageRepository sut;

  setUp(() {
    sut = StorageRepository(datasource);
    registerFallbackValue(StorageSaveTokenParamsFake());
  });

  group('save token', () {
    test('should return right after saving token', () async {
      when(() => datasource.saveToken(params: any(named: 'params')))
          .thenAnswer((_) async => unit);

      final result = await sut.saveToken(
        params: StorageSaveTokenParamsFake(),
      );

      expect(result, isRight);
      expect(result, isRightThat(unit));
      expect(result.fold(id, id), isA<Unit>());
    });

    test('should return left with exception', () async {
      when(() => datasource.saveToken(params: any(named: 'params')))
          .thenThrow(CacheException(message: 'message'));

      final result = await sut.saveToken(
        params: StorageSaveTokenParamsFake(),
      );

      expect(result.fold(id, id), isA<CacheFailure>());
      expect(result, isLeft);
    });

    group('get token', () {
      test('should return right after retrieving token', () async {
        when(() => datasource.getToken()).thenAnswer((_) async => dummyToken);

        final result = await sut.getToken();

        expect(result, isRight);
        expect(result, isRightThat(dummyToken));
        expect(result.fold(id, id), isA<String>());
      });
    });

    test('should return left with exception', () async {
      when(() => datasource.getToken())
          .thenThrow(CacheException(message: 'message'));

      final result = await sut.getToken();

      expect(result.fold(id, id), isA<CacheFailure>());
      expect(result, isLeft);
    });
  });

  group('delete token', () {
    test('should return right after deleting token', () async {
      when(() => datasource.deleteToken()).thenAnswer((_) async => unit);

      final result = await sut.deleteToken();

      expect(result, isRight);
      expect(result, isRightThat(unit));
      expect(result.fold(id, id), isA<Unit>());
    });

    test('should return left with exception', () async {
      when(() => datasource.deleteToken())
          .thenThrow(CacheException(message: 'message'));

      final result = await sut.deleteToken();

      expect(result.fold(id, id), isA<CacheFailure>());
      expect(result, isLeft);
    });
  });
}
