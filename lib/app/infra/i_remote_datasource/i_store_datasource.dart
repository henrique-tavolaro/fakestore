

import '../model/product/product_model.dart';

abstract class IStoreDatasource {
  Future<List<Product>> getProducts();
  Future<List<String>> getCategories();
}