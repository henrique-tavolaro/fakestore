import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/network/client.dart';
import 'package:fakestore/app/core/network/i_client.dart';
import 'package:fakestore/app/infra/model/product/product_model.dart';
import 'package:fakestore/app/external/remote_datasource/store_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'fakes/categories_list_fake.dart';
import 'fakes/fakes.dart';
import 'fakes/products_list_fake.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  final client = HttpClientMock();

  late StoreDatasource sut;

  setUp(() {
    sut = StoreDatasource(client);
    registerFallbackValue(HttpGetParamsFake());
  });

  group('get products', () {
    test('should return a list of products', () async {
      when(() => client.get(params: any(named: 'params'))).thenAnswer(
        (_) async => HttpResponse(
          headers: null,
          statusCode: 200,
          data: products,
        ),
      );

      final result = await sut.getProducts();

      expect(result, isA<List<Product>>());
    });

    test('should throw server exception with code different from 200',
        () async {
      when(() => client.get(params: any(named: 'params'))).thenAnswer(
        (_) async => HttpResponse(
          headers: null,
          statusCode: 400,
          data: '',
        ),
      );

      expect(
          () async => await sut.getProducts(), throwsA(isA<ServerException>()));
    });

    test('should throw server exception', () async {
      when(() => client.get(params: any(named: 'params')))
          .thenThrow(ServerException(message: 'message'));

      expect(
          () async => await sut.getProducts(), throwsA(isA<ServerException>()));
    });
  });

  group('categories list', () {
    test('should return a list of categories', () async {
      when(() => client.get(params: any(named: 'params'))).thenAnswer(
        (_) async => HttpResponse(
          headers: null,
          statusCode: 200,
          data: categories,
        ),
      );

      final result = await sut.getCategories();

      expect(result, isA<List<String>>());
    });

    test('should throw server exception with code different from 200',
        () async {
      when(() => client.get(params: any(named: 'params'))).thenAnswer(
        (_) async => HttpResponse(
          headers: null,
          statusCode: 400,
          data: '',
        ),
      );

      expect(() async => await sut.getCategories(),
          throwsA(isA<ServerException>()));
    });

    test('should throw server exception', () async {
      when(() => client.get(params: any(named: 'params')))
          .thenThrow(ServerException(message: 'message'));

      expect(() async => await sut.getCategories(),
          throwsA(isA<ServerException>()));
    });
  });
}
