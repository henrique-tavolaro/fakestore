

import 'package:dio/dio.dart';

class CustomInterceptor extends InterceptorsWrapper {

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {

    // getToken = Modular.get<GetTokenUseCase>();
    // final inputEither = await getToken(const NoParams());
    //
    // inputEither.fold(
    //       (_) {},
    //       (token) => options.headers['Authorization'] = 'Bearer $token',
    // );

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response<dynamic> response,
      ResponseInterceptorHandler handler,
      ) async {
    // final token = response.headers.value(accessToken);
    //
    // if (token != null) {
    //   saveToken = Modular.get<SaveTokenUseCase>();
    //   await saveToken(SaveTokenParams(token));
    // }

    super.onResponse(response, handler);
  }
}