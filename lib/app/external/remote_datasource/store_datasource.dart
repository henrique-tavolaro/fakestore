import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fakestore/app/core/network/i_client.dart';
import 'package:fakestore/app/infra/model/product/product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:fakestore/app/core/constants/app_texts.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/infra/i_remote_datasource/i_store_datasource.dart';

@Injectable(as: IStoreDatasource)
class StoreDatasource implements IStoreDatasource {
  final IHttpClient client;

  StoreDatasource(this.client);

  @override
  Future<List<Product>> getProducts() async {
    try {
      var result = <Product>[];
      final response = await client.get(params: HttpGetParams(path: '/products'), );

      if (response.statusCode == 200) {
        final data = response.data as List;
        if (data.isNotEmpty) {
          result = data.map<Product>((product) {
            final item = Product.fromJson(product);
            return item;
          }).toList();
        }

        return result;
      }
      throw ServerException(
        message: AppTexts.errorMessage400,
        code: response.statusCode.toString() ?? '',
      );
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw const ServerException.noConnection();
      }

      throw ServerException(
        message: AppTexts.errorMessage400,
        code: e.response?.statusCode?.toString() ?? '',
      );
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      final response =
          await client.get(params: HttpGetParams(path: '/products/categories'),);

      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      }

      throw ServerException(
        message: AppTexts.errorMessage400,
        code: response.statusCode.toString() ?? '',
      );
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw const ServerException.noConnection();
      }

      throw ServerException(
        message: AppTexts.errorMessage400,
        code: e.response?.statusCode?.toString() ?? '',
      );
    }
  }
}
