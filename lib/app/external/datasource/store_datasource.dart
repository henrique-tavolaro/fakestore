

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fakestore/app/core/network/client.dart';
import 'package:fakestore/app/infra/i_datasource/i_store_datasource.dart';
import 'package:fakestore/app/infra/model/product_model.dart';
import 'package:injectable/injectable.dart';

import '../../core/constants/app_texts.dart';
import '../../core/error/failure.dart';

@Injectable(as: IStoreDatasource)
class StoreDatasource implements IStoreDatasource {

  final Dio client;

  StoreDatasource(this.client);

  @override
  Future<List<Product>> getProducts() async {
    try {
      var result = <Product>[];
      final response = await client.get('/products');

      if(response.statusCode == 200){
        final data = response.data as List;
        if(data.isNotEmpty) {
          result = data.map<Product>((product) {
            final item = Product.fromJson(product);
            return item;
          }).toList();
        }

        return result;
      }
      throw ServerException(
        message: AppTexts.errorMessage400,
        code: response.statusCode?.toString() ?? '',
      );


    } on DioError catch (e) {
      print('error message ${e.message} and code: ${e.response?.statusCode?.toString()}');
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