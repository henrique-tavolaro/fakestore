import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/external/remote_datasource/store_datasource.dart';
import 'package:fakestore/app/infra/model/product/product_model.dart';
import 'package:fakestore/app/infra/repositories/store_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../external/datasource/store_datasource.dart';

class MockDatasource extends Mock implements StoreDatasource {}

void main() {
  final datasource = MockDatasource();

  final sut = StoreRepository(datasource);

  test('should return list of products', () async {

    when(() => datasource.getProducts()).thenAnswer((_) async =>
       list
    );
    final result = await sut.getProducts();

    expect(result, isRight);
    expect(result, isRightThat(list));
    expect(result.fold(id, id), isA<List<Product>>());
  });

  test('should throw a server error', () async {
    when(() => datasource.getProducts()).thenThrow(
        ServerException(message: '', code: ''));

     final result = await sut.getProducts();

    expect(result.fold(id, id), isA<ServerFailure>());
    expect(result, isLeft);

  });
}

final list =  products.map<Product>((product) {
  final item = Product.fromJson(product);
  return item;
}).toList();