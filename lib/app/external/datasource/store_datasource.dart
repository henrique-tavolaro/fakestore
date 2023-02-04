

import 'package:dio/dio.dart';
import 'package:fakestore/app/core/network/client.dart';
import 'package:fakestore/app/infra/i_datasource/i_store_datasource.dart';
import 'package:fakestore/app/infra/model/product_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IStoreDatasource)
class StoreDatasource implements IStoreDatasource {

  final Dio client = Dio();


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
      // TODO
      throw Exception('');


    } on DioError catch (e) {
      // TODO
      throw Exception('');
    }
  }

}