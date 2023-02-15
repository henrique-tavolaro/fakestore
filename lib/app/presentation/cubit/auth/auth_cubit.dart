import 'package:fakestore/app/domain/use_cases/auth/login_use_case.dart';
import 'package:fakestore/app/domain/use_cases/auth/register_use_case.dart';
import 'package:fakestore/app/infra/i_remote_datasource/i_auth_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit(
    this.loginUseCase,
    this.registerUseCase,
  ) : super(AuthState.initial());

  Future<void> login(AuthLoginParams params) async {
    emit(AuthState.loading());
    final inputEither = await loginUseCase(
      params: params,
    );

    inputEither.fold(
      (l) => emit(AuthState.failed(l.message)),
      (_) => emit(AuthState.logged()),
    );
  }

  Future<void> register(AuthRegisterParams params) async {
    emit(AuthState.loading());
    final inputEither = await registerUseCase(
      params: params,
    );

    inputEither.fold(
      (l) => emit(AuthState.failed(l.message)),
      (_) => emit(AuthState.registered()),
    );
  }
}
