import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/i_repositories/i_auth_repository.dart';
import 'package:fakestore/app/infra/i_remote_datasource/i_auth_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase implements UseCase<Unit, AuthRegisterParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(
      {required AuthRegisterParams params}) async {
    return await repository.register(
      params: params
    );
  }
}
