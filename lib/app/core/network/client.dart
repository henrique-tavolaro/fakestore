

import 'package:dio/dio.dart';
import 'package:fakestore/app/core/constants/network.dart';
import 'package:fakestore/app/core/constants/url.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioInjectableModule {
  @lazySingleton
  Dio get client => Dio(
      BaseOptions(
          baseUrl: BASEURL,
          contentType: keyAcceptValue))..interceptors.addAll([
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ),
  ]);
}
