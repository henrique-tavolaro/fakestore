part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loaded(List<String> categories) = _Loaded;
  const factory CategoriesState.failed(String message) = _Failed;
}