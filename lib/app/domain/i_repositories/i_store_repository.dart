

import 'package:dartz/dartz.dart';
import 'package:fakestore/app/infra/model/product_model.dart';

abstract class IStoreRepository {
  Future<Either<Exception, List<Product>>> getProducts();
}