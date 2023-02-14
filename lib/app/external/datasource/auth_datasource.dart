import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fakestore/app/core/constants/app_texts.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/core/network/i_client.dart';
import 'package:fakestore/app/infra/i_datasource/i_auth_datasource.dart';
import 'package:fakestore/app/infra/model/user/user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthDatasource)
class AuthDatasource implements IAuthDatasource {
  final IHttpClient client;

  AuthDatasource(this.client);

  @override
  Future<User> login(AuthLoginParams params) async {
    try {
      final response = await client.post(
        HttpPostParams(
          path: '/auth/login',
          data: {
            "email": params.email,
            "password": params.password,
          },
        ),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }

      throw ServerException(message: AppTexts.wrongUserorPassword);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw const ServerException.noConnection();
      }

      throw ServerException(
        message: AppTexts.errorMessage400,
        code: e.response?.statusCode?.toString() ?? '',
      );
    }
  }

  @override
  Future<Unit> register(AuthRegisterParams params) async {
    try {
      final response = await client.post(
        HttpPostParams(
          path: '/auth/register',
          data: {
            "name": params.name,
            "email": params.email,
            "password": params.password
          },
        ),
      );

      if(response.statusCode == 201) {
        return unit;
      }

      throw ServerException(message: AppTexts.errorCreatingUser);

    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw const ServerException.noConnection();
      }

      throw ServerException(
        message: AppTexts.errorMessage400,
        code: e.response?.statusCode?.toString() ?? '',
      );
    }
  }
}
