import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/external/remote_datasource/store_datasource.dart';
import 'package:fakestore/app/infra/model/product/product_model.dart';
import 'package:fakestore/app/infra/repositories/store_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../external/datasource/remote_datasource/fakes/categories_list_fake.dart';
import '../../external/datasource/remote_datasource/fakes/products_list_fake.dart';

class MockDatasource extends Mock implements StoreDatasource {}

void main() {
  final datasource = MockDatasource();

  final sut = StoreRepository(datasource);

  group('get products', (){
    test('should return list of products', () async {
      when(() => datasource.getProducts()).thenAnswer((_) async => productsList);
      final result = await sut.getProducts();

      expect(result, isRight);
      expect(result, isRightThat(productsList));
      expect(result.fold(id, id), isA<List<Product>>());
    });

    test('should throw a server error', () async {
      when(() => datasource.getProducts())
          .thenThrow(ServerException(message: '', code: ''));

      final result = await sut.getProducts();

      expect(result.fold(id, id), isA<ServerFailure>());
      expect(result, isLeft);
    });
  });

  group('get categories', (){
    test('should return list of categories', () async {
      when(() => datasource.getCategories()).thenAnswer((_) async => categories);
      final result = await sut.getCategories();

      expect(result, isRight);
      expect(result, isRightThat(categories));
      expect(result.fold(id, id), isA<List<String>>());
    });

    test('should throw a server error', () async {
      when(() => datasource.getCategories())
          .thenThrow(ServerException(message: '', code: ''));

      final result = await sut.getCategories();

      expect(result.fold(id, id), isA<ServerFailure>());
      expect(result, isLeft);
    });
  });
}


