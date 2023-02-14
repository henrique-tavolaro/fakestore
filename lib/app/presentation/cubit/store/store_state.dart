part of 'store_cubit.dart';


@freezed
class StoreState with _$StoreState {
  const factory StoreState.initial() = _Initial;
  const factory StoreState.loading() = _Loading;
  const factory StoreState.loaded(List<Product> products) = _Loaded;
  const factory StoreState.failed(String message) = _Failed;
}