import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:fakestore/app/core/config/injection.dart';
import 'package:fakestore/app/core/error/failure.dart';
import 'package:fakestore/app/domain/i_repositories/i_store_repository.dart';
import 'package:fakestore/app/infra/repositories/store_repository.dart';
import 'package:fakestore/app/presentation/cubit/store/store_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../infra/repositories/store_repository_test.dart';

class StoreRepositoryMock extends Mock implements IStoreRepository {}

void main() {
  final repository = StoreRepositoryMock();

  late StoreCubit cubit;

  setUp((){
    cubit = StoreCubit(repository);
  });

  test('should emit initial state', () async {
    expect(cubit.state, StoreState.initial()
    );
  });

  blocTest<StoreCubit, StoreState>(
      'should emit products list',
      setUp: () {
        when(() => repository.getProducts()).thenAnswer((_) async =>
            Right(list)
        );
      },
      build: () => cubit,
    act: (cubit) => cubit.getProducts(),
    expect: () => [StoreState.loading(), StoreState.loaded(list)],
    verify: (_){
      verify (() => repository.getProducts()).called(1);
    }
  );

  blocTest<StoreCubit, StoreState>(
      'should emit error message',
      setUp: () {
        when(() => repository.getProducts()).thenAnswer((_) async =>
            Left(ServerFailure(message: '', code: ''))
        );
      },
      build: () => cubit,
      act: (cubit) => cubit.getProducts(),
      expect: () => [StoreState.loading(), StoreState.failed('')],
      verify: (_){
        verify (() => repository.getProducts()).called(1);
      }
  );
}