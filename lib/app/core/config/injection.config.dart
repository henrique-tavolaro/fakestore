// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:fakestore/app/core/cache/local_storage/i_local_storage.dart'
    as _i6;
import 'package:fakestore/app/core/cache/local_storage/local_storage.dart'
    as _i7;
import 'package:fakestore/app/core/network/client.dart' as _i5;
import 'package:fakestore/app/core/network/dio.dart' as _i30;
import 'package:fakestore/app/core/network/i_client.dart' as _i4;
import 'package:fakestore/app/domain/i_repositories/i_auth_repository.dart'
    as _i23;
import 'package:fakestore/app/domain/i_repositories/i_storage_repository.dart'
    as _i10;
import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart'
    as _i14;
import 'package:fakestore/app/domain/use_cases/auth/login_use_case.dart'
    as _i25;
import 'package:fakestore/app/domain/use_cases/auth/register_use_case.dart'
    as _i27;
import 'package:fakestore/app/domain/use_cases/storage/delete_token_use_case.dart'
    as _i17;
import 'package:fakestore/app/domain/use_cases/storage/get_token_use_case.dart'
    as _i20;
import 'package:fakestore/app/domain/use_cases/storage/save_token_use_case.dart'
    as _i16;
import 'package:fakestore/app/domain/use_cases/store/get_categories_use_case.dart'
    as _i18;
import 'package:fakestore/app/domain/use_cases/store/get_products_use_case.dart'
    as _i19;
import 'package:fakestore/app/external/local_datasource/storage_datasource.dart'
    as _i9;
import 'package:fakestore/app/external/remote_datasource/auth_datasource.dart'
    as _i22;
import 'package:fakestore/app/external/remote_datasource/store_datasource.dart'
    as _i13;
import 'package:fakestore/app/infra/i_local_datasource/i_storage_datasource.dart'
    as _i8;
import 'package:fakestore/app/infra/i_remote_datasource/i_auth_datasource.dart'
    as _i21;
import 'package:fakestore/app/infra/i_remote_datasource/i_store_datasource.dart'
    as _i12;
import 'package:fakestore/app/infra/repositories/auth_repository.dart' as _i24;
import 'package:fakestore/app/infra/repositories/storage_repository.dart'
    as _i11;
import 'package:fakestore/app/infra/repositories/store_repository.dart' as _i15;
import 'package:fakestore/app/presentation/cubit/auth/auth_cubit.dart' as _i28;
import 'package:fakestore/app/presentation/cubit/categories/categories_cubit.dart'
    as _i29;
import 'package:fakestore/app/presentation/cubit/products/products_cubit.dart'
    as _i26;
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
  gh.factory<_i6.ILocalStorage>(() => _i7.LocalStorage());
  gh.factory<_i8.IStorageDatasource>(
      () => _i9.StorageDatasource(gh<_i7.LocalStorage>()));
  gh.factory<_i10.IStorageRepository>(
      () => _i11.StorageRepository(gh<_i9.StorageDatasource>()));
  gh.factory<_i12.IStoreDatasource>(
      () => _i13.StoreDatasource(gh<_i4.IHttpClient>()));
  gh.factory<_i14.IStoreRepository>(
      () => _i15.StoreRepository(gh<_i12.IStoreDatasource>()));
  gh.factory<_i16.SaveTokenUseCase>(
      () => _i16.SaveTokenUseCase(gh<_i10.IStorageRepository>()));
  gh.factory<_i17.DeleteTokenUseCase>(
      () => _i17.DeleteTokenUseCase(gh<_i10.IStorageRepository>()));
  gh.factory<_i18.GetCategoriesUseCase>(
      () => _i18.GetCategoriesUseCase(gh<_i14.IStoreRepository>()));
  gh.factory<_i19.GetProductsUseCase>(
      () => _i19.GetProductsUseCase(gh<_i14.IStoreRepository>()));
  gh.factory<_i20.GetTokenUseCase>(
      () => _i20.GetTokenUseCase(gh<_i10.IStorageRepository>()));
  gh.factory<_i21.IAuthDatasource>(
      () => _i22.AuthDatasource(gh<_i4.IHttpClient>()));
  gh.factory<_i23.IAuthRepository>(
      () => _i24.AuthRepository(gh<_i21.IAuthDatasource>()));
  gh.factory<_i25.LoginUseCase>(
      () => _i25.LoginUseCase(gh<_i23.IAuthRepository>()));
  gh.factory<_i26.ProductsCubit>(
      () => _i26.ProductsCubit(gh<_i19.GetProductsUseCase>()));
  gh.factory<_i27.RegisterUseCase>(
      () => _i27.RegisterUseCase(gh<_i23.IAuthRepository>()));
  gh.factory<_i28.AuthCubit>(() => _i28.AuthCubit(
        gh<_i25.LoginUseCase>(),
        gh<_i27.RegisterUseCase>(),
      ));
  gh.factory<_i29.CategoriesCubit>(
      () => _i29.CategoriesCubit(gh<_i18.GetCategoriesUseCase>()));
  return getIt;
}

class _$DioInjectableModule extends _i30.DioInjectableModule {}
