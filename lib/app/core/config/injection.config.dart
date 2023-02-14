// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:fakestore/app/core/network/client.dart' as _i5;
import 'package:fakestore/app/core/network/dio.dart' as _i16;
import 'package:fakestore/app/core/network/i_client.dart' as _i4;
import 'package:fakestore/app/domain/i_repositories/i_auth_repository.dart'
    as _i14;
import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart'
    as _i8;
import 'package:fakestore/app/external/datasource/auth_datasource.dart' as _i13;
import 'package:fakestore/app/external/datasource/store_datasource.dart' as _i7;
import 'package:fakestore/app/infra/i_datasource/i_auth_datasource.dart'
    as _i12;
import 'package:fakestore/app/infra/i_datasource/i_store_datasource.dart'
    as _i6;
import 'package:fakestore/app/infra/repositories/auth_repository.dart' as _i15;
import 'package:fakestore/app/infra/repositories/store_repository.dart' as _i9;
import 'package:fakestore/app/presentation/cubit/categories/categories_cubit.dart'
    as _i11;
import 'package:fakestore/app/presentation/cubit/store/store_cubit.dart'
    as _i10;
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
  gh.factory<_i4.IHttpClient>(() => _i5.HttpClient());
  gh.factory<_i6.IStoreDatasource>(
      () => _i7.StoreDatasource(gh<_i4.IHttpClient>()));
  gh.factory<_i8.IStoreRepository>(
      () => _i9.StoreRepository(gh<_i6.IStoreDatasource>()));
  gh.factory<_i10.StoreCubit>(
      () => _i10.StoreCubit(gh<_i8.IStoreRepository>()));
  gh.factory<_i11.CategoriesCubit>(
      () => _i11.CategoriesCubit(gh<_i8.IStoreRepository>()));
  gh.factory<_i12.IAuthDatasource>(
      () => _i13.AuthDatasource(gh<_i4.IHttpClient>()));
  gh.factory<_i14.IAuthRepository>(
      () => _i15.AuthRepository(gh<_i12.IAuthDatasource>()));
  return getIt;
}

class _$DioInjectableModule extends _i16.DioInjectableModule {}
