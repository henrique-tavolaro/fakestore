import 'package:dio/dio.dart';
import 'package:fakestore/app/core/network/i_client.dart';
import 'package:fakestore/app/core/network/interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/network.dart';
import '../constants/url.dart';

@Injectable(as: IHttpClient)
class HttpClient extends IHttpClient {
  final Dio dio = Dio(
      BaseOptions(
          baseUrl: BASEURL,
          contentType: keyAcceptValue))..interceptors.addAll([
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ),
    CustomInterceptor()
  ]);

  @override
  Future<HttpResponse<T>> get<T>(HttpGetParams params) async {
    final result = await dio.get(
      params.path,
      queryParameters: params.queryParameters ?? null,
    );

    return HttpResponse(
      statusCode: result.statusCode!,
      data: result.data,
      headers: result.headers.map ?? null,
    );
  }

  @override
  Future<HttpResponse<T>> post<T>(HttpPostParams params) async {
    final result = await dio.post(
      params.path,
      data: params.data,
      queryParameters: params.queryParameters ?? null,
    );

    return HttpResponse(
      statusCode: result.statusCode!,
      data: result.data,
      headers: result.headers.map ?? null,
    );
  }

  @override
  Future<HttpResponse<T>> put<T>(HttpPutParams params) async {
    final result = await dio.put(
      params.path,
      data: params.data,
      queryParameters: params.queryParameters ?? null,
    );

    return HttpResponse(
      statusCode: result.statusCode!,
      data: result.data,
      headers: result.headers.map ?? null,
    );
  }

  @override
  Future<HttpResponse<T>> delete<T>(HttpDeleteParams params) async {
    final result = await dio.delete(
      params.path,
      data: params.data,
      queryParameters: params.queryParameters ?? null,
    );

    return HttpResponse(
      statusCode: result.statusCode!,
      data: result.data,
      headers: result.headers.map ?? null,
    );
  }
}
