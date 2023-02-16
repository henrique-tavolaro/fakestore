import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/use_cases/storage/get_token_use_case.dart';
import 'package:fakestore/app/infra/repositories/storage_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class StorageRepositoryMock extends Mock implements StorageRepository {}

void main() {
  final repository = StorageRepositoryMock();

  final dummyToken = 'token';

  late GetTokenUseCase sut;

  setUp(() {
    sut = GetTokenUseCase(repository);
  });

  test('should return right with token', () async {
    when(() => repository.getToken()).thenAnswer(
      (_) async => Right(dummyToken),
    );

    final result = await sut.call(params: NoParams());

    expect(result, isRight);
    expect(result, isRightThat(dummyToken));
    expect(result.fold(id, id), isA<String>());
  });

  test('should return left with a failure', () async {
    when(() => repository.getToken()).thenAnswer(
      (_) async => Left(
        CacheFailure(message: ''),
      ),
    );

    final result = await sut.call(params: NoParams());

    expect(result.fold(id, id), isA<CacheFailure>());
    expect(result, isLeft);
  });
}
