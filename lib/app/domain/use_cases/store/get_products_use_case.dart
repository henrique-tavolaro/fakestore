
import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart';
import 'package:fakestore/app/infra/model/product/product_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase implements UseCase<List<Product>, NoParams>{

  final IStoreRepository repository;

  GetProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call({required NoParams params}) async {
    return repository.getProducts();
  }
}