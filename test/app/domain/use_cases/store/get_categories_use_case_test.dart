import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/use_cases/store/get_categories_use_case.dart';
import 'package:fakestore/app/infra/repositories/store_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../external/datasource/remote_datasource/fakes/categories_list_fake.dart';

class StoreRepositoryMock extends Mock implements StoreRepository {}

void main() {
  final repository = StoreRepositoryMock();

  late GetCategoriesUseCase sut;

  setUp(() {
    sut = GetCategoriesUseCase(repository);
  });

  test('should return right with list of categories', () async {
    when(() => repository.getCategories()).thenAnswer((_) async =>
        Right(categories));


    final result = await sut.call(params: NoParams());

    expect(result, isRight);
    expect(result, isRightThat(categories));
    expect(result.fold(id, id), isA<List<String>>());
  });

  test('should return left with a failure', () async {
    when(() => repository.getCategories()).thenAnswer(
          (_) async => Left(
        ServerFailure(message: '', code: ''),
      ),
    );

    final result = await sut.call(params: NoParams());

    expect(result.fold(id, id), isA<ServerFailure>());
    expect(result, isLeft);
  });
}