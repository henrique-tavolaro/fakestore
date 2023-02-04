import 'package:dio/dio.dart';
import 'package:fakestore/app/core/config/injection.dart';
import 'package:fakestore/app/external/datasource/store_datasource.dart';
import 'package:fakestore/app/infra/repositories/store_repository.dart';
import 'package:fakestore/app/presentation/cubit/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/flavor/flavors.dart';

class MyApp extends StatelessWidget {

  final Flavor flavor;

  const MyApp({Key? key, required this.flavor}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (_) =>
          getIt<StoreCubit>()
            ..getProducts(),
          child: MyHomePage(title: 'Flutter $flavor')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter $title'),
      ),
      body: BlocBuilder<StoreCubit, StoreState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox.shrink(),
            loading: () => Center(child: CircularProgressIndicator(),),
            loaded: (products) => Text(products.toString()),
            failed: (error) => Text(error),);
        },
      ),
    );
  }
}


