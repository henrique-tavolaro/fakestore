import 'package:dartz/dartz.dart';
import 'package:fakestore/app/infra/model/product_model.dart';
import '../../core/error/failure.dart';

abstract class IStoreRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}