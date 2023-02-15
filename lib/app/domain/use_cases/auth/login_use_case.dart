import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/i_repositories/i_auth_repository.dart';
import 'package:fakestore/app/infra/i_remote_datasource/i_auth_datasource.dart';
import 'package:fakestore/app/infra/model/user/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase implements UseCase<User, AuthLoginParams> {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call({required AuthLoginParams params}) async {
    return await repository.login(
      params: params,
    );
  }
}
