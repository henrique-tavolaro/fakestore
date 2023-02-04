// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:fakestore/app/core/network/client.dart' as _i10;
import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart'
    as _i6;
import 'package:fakestore/app/external/datasource/store_datasource.dart' as _i5;
import 'package:fakestore/app/infra/i_datasource/i_store_datasource.dart'
    as _i4;
import 'package:fakestore/app/infra/repositories/store_repository.dart' as _i7;
import 'package:fakestore/app/presentation/cubit/store_cubit.dart' as _i9;
import 'package:flutter_bloc/flutter_bloc.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioInjectableModule = _$DioInjectableModule();
  gh.lazySingleton<_i3.Dio>(() => dioInjectableModule.client);
  gh.factory<_i4.IStoreDatasource>(() => _i5.StoreDatasource());
  gh.factory<_i6.IStoreRepository>(
      () => _i7.StoreRepository(gh<_i4.IStoreDatasource>()));
  gh.factory<_i8.Cubit<_i9.StoreState>>(
      () => _i9.StoreCubit(gh<_i6.IStoreRepository>()));
  return getIt;
}

class _$DioInjectableModule extends _i10.DioInjectableModule {}
