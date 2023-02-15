import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/i_repositories/i_storage_repository.dart';
import 'package:fakestore/app/infra/i_local_datasource/i_storage_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveTokenUseCase implements UseCase<Unit, StorageSaveTokenParams> {
  final IStorageRepository repository;

  SaveTokenUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call({required StorageSaveTokenParams params}) {
    return repository.saveToken(
      params: params,
    );
  }
}
