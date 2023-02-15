import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/domain/i_repositories/i_auth_repository.dart';
import 'package:fakestore/app/infra/i_remote_datasource/i_auth_datasource.dart';
import 'package:fakestore/app/infra/model/user/user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepository(this.datasource);

  @override
  Future<Either<Failure, User>> login({required AuthLoginParams params}) async {
    try {
      final result = await datasource.login(
        params: params
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, Unit>> register(
      {required AuthRegisterParams params}) async {
    try {
      final result = await datasource.register(
        params: params
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message, code: e.code));
    }
  }
}
