import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/infra/model/user/user_model.dart';
import 'package:fakestore/app/infra/i_remote_datasource/i_auth_datasource.dart';

abstract class IAuthRepository {
  Future<Either<Failure, User>> login({required AuthLoginParams params});

  Future<Either<Failure, Unit>> register({required AuthRegisterParams params});
}
