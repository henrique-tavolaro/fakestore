import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/use_cases/storage/delete_token_use_case.dart';
import 'package:fakestore/app/infra/repositories/storage_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class StorageRepositoryMock extends Mock implements StorageRepository {}

void main() {
  final repository = StorageRepositoryMock();

  late DeleteTokenUseCase sut;

  setUp(() {
    sut = DeleteTokenUseCase(repository);

  });

  test('should return right with unit', () async {
    when(() => repository.deleteToken()).thenAnswer(
          (_) async => Right(unit),
    );

    final result = await sut.call(params: NoParams());

    expect(result, isRight);
    expect(result, isRightThat(unit));
    expect(result.fold(id, id), isA<Unit>());
  });

  test('should return left with a failure', () async {
    when(() => repository.deleteToken()).thenAnswer(
          (_) async => Left(
        CacheFailure(message: ''),
      ),
    );

    final result = await sut.call(params: NoParams());

    expect(result.fold(id, id), isA<CacheFailure>());
    expect(result, isLeft);
  });
}
