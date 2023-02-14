import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/domain/i_repositories/i_auth_repository.dart';
import 'package:fakestore/app/infra/i_datasource/i_auth_datasource.dart';
import 'package:fakestore/app/infra/model/user/user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepository(this.datasource);

  @override
  Future<Either<Failure, User>> login(
      AuthLoginParams params) async {
    try {
      final result = await datasource.login(
        AuthLoginParams(
          email: params.email,
          password: params.password,
        ),
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, Unit>> register(
      AuthRegisterParams params) async {
    try {
      final result = await datasource.register(
        AuthRegisterParams(
            name: params.name,
            email: params.email,
            password: params.password,
        ),
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message, code: e.code));
    }
  }
}
