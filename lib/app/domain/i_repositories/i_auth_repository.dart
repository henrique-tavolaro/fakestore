import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/infra/i_datasource/i_auth_datasource.dart';
import 'package:fakestore/app/infra/model/user/user_model.dart';

abstract class IAuthRepository {
  Future<Either<Failure, User>> login(AuthLoginParams params);

  Future<Either<Failure, Unit>> register(AuthRegisterParams params);
}
