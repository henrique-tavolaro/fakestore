import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart';
import 'package:fakestore/app/domain/use_cases/store/get_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'categories_state.dart';

part 'categories_cubit.freezed.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase useCase;

  CategoriesCubit(this.useCase) : super(CategoriesState.initial());

  Future<void> getCategories() async {
    final inputEither = await useCase(params: NoParams());

    inputEither.fold((l) => emit(CategoriesState.failed(l.message)),
        (r) => emit(CategoriesState.loaded(r)));
  }
}
