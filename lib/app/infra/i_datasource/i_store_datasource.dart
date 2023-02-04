

import '../model/product_model.dart';

abstract class IStoreDatasource {
  Future<List<Product>> getProducts();
}