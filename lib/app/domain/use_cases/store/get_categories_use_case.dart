

import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase implements UseCase<List<String>, NoParams> {

  final IStoreRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call({required NoParams params}) async {
    return repository.getCategories();
  }

}