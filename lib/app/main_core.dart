
import 'dart:async';
import 'package:fakestore/app/core/config/injection.dart';
import 'package:fakestore/app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'core/flavor/flavors.dart';

Future<void> buildMain(Flavor flavor) async {
  appFlavor = flavor;

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await configureDependencies();
  await runZonedGuarded(

      () async => runApp(
          MyApp(flavor: flavor,)
      ),
      (error, stackTrace) {
        print("Error: $error, StackTrace: $stackTrace");
      });
}