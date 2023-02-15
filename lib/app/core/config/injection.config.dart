// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:fakestore/app/core/network/client.dart' as _i7;
import 'package:fakestore/app/core/network/dio.dart' as _i16;
import 'package:fakestore/app/core/network/i_client.dart' as _i6;
import 'package:fakestore/app/domain/i_repositories/i_auth_repository.dart'
    as _i4;
import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart'
    as _i10;
import 'package:fakestore/app/external/remote_datasource/auth_datasource.dart'
    as _i15;
import 'package:fakestore/app/external/remote_datasource/store_datasource.dart'
    as _i9;
import 'package:fakestore/app/infra/i_remote_datasource/i_auth_datasource.dart'
    as _i14;
import 'package:fakestore/app/infra/i_remote_datasource/i_store_datasource.dart'
    as _i8;
import 'package:fakestore/app/infra/repositories/auth_repository.dart' as _i5;
import 'package:fakestore/app/infra/repositories/store_repository.dart' as _i11;
import 'package:fakestore/app/presentation/cubit/categories/categories_cubit.dart'
    as _i13;
import 'package:fakestore/app/presentation/cubit/store/store_cubit.dart'
    as _i12;
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
  gh.factory<_i4.IAuthRepository>(() => _i5.AuthRepository(gh<dynamic>()));
  gh.factory<_i6.IHttpClient>(() => _i7.HttpClient());
  gh.factory<_i8.IStoreDatasource>(
      () => _i9.StoreDatasource(gh<_i6.IHttpClient>()));
  gh.factory<_i10.IStoreRepository>(() => _i11.StoreRepository(gh<dynamic>()));
  gh.factory<_i12.StoreCubit>(
      () => _i12.StoreCubit(gh<_i10.IStoreRepository>()));
  gh.factory<_i13.CategoriesCubit>(
      () => _i13.CategoriesCubit(gh<_i10.IStoreRepository>()));
  gh.factory<_i14.IAuthDatasource>(
      () => _i15.AuthDatasource(gh<_i6.IHttpClient>()));
  return getIt;
}

class _$DioInjectableModule extends _i16.DioInjectableModule {}
