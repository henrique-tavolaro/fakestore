import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../infra/model/product_model.dart';

part 'store_state.dart';
part 'store_cubit.freezed.dart';

@Injectable(as: Cubit)
class StoreCubit extends Cubit<StoreState> {
  final IStoreRepository repository;

  StoreCubit(
    this.repository,
  ) : super(StoreState.initial());

  Future<void> getProducts() async {
    emit(const StoreState.loading());
    final inputEither = await repository.getProducts();

    inputEither.fold(
            (l) => emit(StoreState.failed(l.toString())),
            (r) => emit(StoreState.loaded(r)));
  }
}
