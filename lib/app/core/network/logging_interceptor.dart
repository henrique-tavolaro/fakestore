import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
//
//
//
// @injectable
// class LoggingInterceptor extends InterceptorsWrapper {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     log(
//       '''
// ==== BEGIN REQUEST ====
//   Url -> ${options.baseUrl}${options.path}
//   Method -> ${options.method}
//   Headers -> ${options.headers}
//   Data -> ${options.data}
// ==== END REQUEST ====
// ''',
//     );
//
//     super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(
//       Response<dynamic> response,
//       ResponseInterceptorHandler handler,
//       ) {
//     final requestOptions = response.requestOptions;
//     log(
//       '''
// ==== BEGIN RESPONSE ====
//   Url -> ${requestOptions.uri}
//   Method -> ${requestOptions.method}
//   Code -> ${response.statusCode}
//   Headers -> ${requestOptions.headers}
//   Data -> ${response.data}
// ==== END RESPONSE ====
//     ''',
//     );
//
//     super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     final response = err.response;
//     final requestOptions = response?.requestOptions;
//
//     log(
//       '''
// ==== BEGIN ERROR RESPONSE ====
//   Url -> ${requestOptions?.baseUrl}${requestOptions?.path}
//   Code -> ${response?.statusCode}
//   Headers -> ${requestOptions?.headers}
//   Message -> ${response?.statusMessage}
//   Body -> ${err.response}
// ==== END ERROR RESPONSE ====
//       ''',
//     );
//
//     super.onError(err, handler);
//   }
// }