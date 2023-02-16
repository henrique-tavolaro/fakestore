import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/use_cases/store/get_categories_use_case.dart';
import 'package:fakestore/app/domain/use_cases/store/get_products_use_case.dart';
import 'package:fakestore/app/infra/model/product/product_model.dart';
import 'package:fakestore/app/infra/repositories/store_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../external/datasource/remote_datasource/fakes/categories_list_fake.dart';
import '../../../external/datasource/remote_datasource/fakes/products_list_fake.dart';

class StoreRepositoryMock extends Mock implements StoreRepository {}

void main() {
  final repository = StoreRepositoryMock();

  late GetProductsUseCase sut;

  setUp(() {
    sut = GetProductsUseCase(repository);
  });

  test('should return right with list of products', () async {
    when(() => repository.getProducts()).thenAnswer((_) async =>
        Right(productsList));


    final result = await sut.call(params: NoParams());

    expect(result, isRight);
    expect(result, isRightThat(productsList));
    expect(result.fold(id, id), isA<List<Product>>());
  });

  test('should return left with a failure', () async {
    when(() => repository.getProducts()).thenAnswer(
          (_) async => Left(
        ServerFailure(message: '', code: ''),
      ),
    );

    final result = await sut.call(params: NoParams());

    expect(result.fold(id, id), isA<ServerFailure>());
    expect(result, isLeft);
  });
}