import 'package:fakestore/app/core/cache/local_storage/i_local_storage.dart';
import 'package:fakestore/app/infra/i_local_datasource/i_storage_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

class LocalStorageWriteParamsFake extends Fake
    implements LocalStorageWriteParams {}

class LocalStorageReadParamsFake extends Fake
    implements LocalStorageReadParams {}

class LocalStorageDeleteParamsFake extends Fake
    implements LocalStorageDeleteParams {}

class StorageSaveTokenParamsFake extends Fake
    implements StorageSaveTokenParams {}
