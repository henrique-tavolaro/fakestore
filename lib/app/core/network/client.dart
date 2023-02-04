

import 'package:dio/dio.dart';
import 'package:fakestore/app/core/constants/network.dart';
import 'package:fakestore/app/core/constants/url.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioInjectableModule {
  @lazySingleton
  Dio get client => Dio(
      BaseOptions(
          baseUrl: BASEURL,
          contentType: keyAcceptValue));
}
