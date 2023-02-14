import 'package:dio/dio.dart';
import 'package:fakestore/app/core/config/injection.dart';
import 'package:fakestore/app/external/datasource/store_datasource.dart';
import 'package:fakestore/app/infra/repositories/store_repository.dart';
import 'package:fakestore/app/presentation/cubit/store/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/flavor/flavors.dart';
import 'core/router/routes.dart';

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}




