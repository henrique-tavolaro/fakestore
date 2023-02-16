import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/domain/use_cases/storage/save_token_use_case.dart';
import 'package:fakestore/app/infra/repositories/storage_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../external/datasource/local_datasource/fakes/fakes.dart';

class StorageRepositoryMock extends Mock implements StorageRepository {}

void main() {
  final repository = StorageRepositoryMock();

  late SaveTokenUseCase sut;

  setUp(() {
    sut = SaveTokenUseCase(repository);
    registerFallbackValue(StorageSaveTokenParamsFake());
  });

  test('should return right with unit', () async {
    when(() => repository.saveToken(params: any(named: 'params'))).thenAnswer(
      (_) async => Right(unit),
    );

    final result = await sut.call(params: StorageSaveTokenParamsFake());

    expect(result, isRight);
    expect(result, isRightThat(unit));
    expect(result.fold(id, id), isA<Unit>());
  });

  test('should return left with a failure', () async {
    when(() => repository.saveToken(params: any(named: 'params'))).thenAnswer(
      (_) async => Left(
        CacheFailure(message: ''),
      ),
    );

    final result = await sut.call(params: StorageSaveTokenParamsFake());

    expect(result.fold(id, id), isA<CacheFailure>());
    expect(result, isLeft);
  });
}
