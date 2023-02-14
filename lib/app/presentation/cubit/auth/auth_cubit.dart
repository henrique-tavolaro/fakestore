import 'package:fakestore/app/domain/i_repositories/i_auth_repository.dart';
import 'package:fakestore/app/infra/i_datasource/i_auth_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository repository;

  AuthCubit(this.repository) : super(AuthState.initial());

  Future<void> login(AuthLoginParams params) async {
    emit(AuthState.loading());
    final inputEither = await repository.login(
      AuthLoginParams(
        email: params.email,
        password: params.password,
      ),
    );

    inputEither.fold(
      (l) => emit(AuthState.failed(l.message)),
      (_) => emit(AuthState.logged()),
    );
  }

  Future<void> register(AuthRegisterParams params) async {
    emit(AuthState.loading());
    final inputEither = await repository.register(
      AuthRegisterParams(
        name: params.name,
        email: params.email,
        password: params.password,
      ),
    );

    inputEither.fold(
      (l) => emit(AuthState.failed(l.message)),
      (_) => emit(AuthState.registered()),
    );
  }
}
