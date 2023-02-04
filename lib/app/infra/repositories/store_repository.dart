import 'package:dartz/dartz.dart';
import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart';
import 'package:fakestore/app/infra/model/product_model.dart';
import 'package:injectable/injectable.dart';
import '../i_datasource/i_store_datasource.dart';

@Injectable(as: IStoreRepository)
class StoreRepository implements IStoreRepository {

  final IStoreDatasource datasource;

  StoreRepository(this.datasource);

  @override
  Future<Either<Exception, List<Product>>> getProducts() async {
    try {
      final result = await datasource.getProducts();

      return right(result);
    } catch (e) {
      return left(Exception(e));
    }
  }

}