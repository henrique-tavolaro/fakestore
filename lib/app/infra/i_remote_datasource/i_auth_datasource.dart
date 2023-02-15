import 'package:dartz/dartz.dart';
import 'package:fakestore/app/infra/model/user/user_model.dart';

abstract class IAuthDatasource {
  Future<User> login(AuthLoginParams params);

  Future<Unit> register(AuthRegisterParams params);
}

class AuthRegisterParams {
  final String name;
  final String email;
  final String password;

  AuthRegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });
}

class AuthLoginParams {
  final String email;
  final String password;

  AuthLoginParams({
    required this.email,
    required this.password,
  });
}
