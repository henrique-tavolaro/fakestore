import 'package:fakestore/app/domain/use_cases/store/get_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:fakestore/app/core/use_cases/use_case.dart';
import 'package:fakestore/app/infra/model/product/product_model.dart';

part 'products_state.dart';

part 'products_cubit.freezed.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsUseCase useCase;

  ProductsCubit(this.useCase) : super(ProductsState.initial());

  Future<void> getProducts() async {
    emit(const ProductsState.loading());
    final inputEither = await useCase(params: NoParams());

    inputEither.fold((l) => emit(ProductsState.failed(l.message)),
        (r) => emit(ProductsState.loaded(r)));
  }
}
