
import 'package:fakestore/app/core/cache/local_storage/i_local_storage.dart';
import 'package:fakestore/app/core/cache/local_storage/local_storage.dart';
import 'package:fakestore/app/core/constants/app_keys.dart';
import 'package:fakestore/app/external/local_datasource/storage_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageMock extends Mock implements LocalStorage{}

void main(){

  final storage = LocalStorageMock();

  late StorageDatasource sut;

  setUp(() {
    sut = StorageDatasource(storage);
  });

  final writeParams = LocalStorageWriteParams(key: 'token', value: 'value');

  test('should save token in local storage', () async => {
    when(() => storage.write(params: writeParams))
  });


}