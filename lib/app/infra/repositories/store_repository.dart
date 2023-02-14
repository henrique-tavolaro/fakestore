import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart';
import 'package:fakestore/app/infra/model/product/product_model.dart';
import 'package:injectable/injectable.dart';
import '../i_datasource/i_store_datasource.dart';

@Injectable(as: IStoreRepository)
class StoreRepository implements IStoreRepository {

  final IStoreDatasource datasource;

  StoreRepository(this.datasource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final result = await datasource.getProducts();

      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final result = await datasource.getCategories();

      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message, code: e.code));
    }
  }

}