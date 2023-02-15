import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/i_repositories/i_storage_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteTokenUseCase implements UseCase<Unit, NoParams> {

  final IStorageRepository repository;

  DeleteTokenUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call({required NoParams params}) {
    return repository.deleteToken();
  }

}