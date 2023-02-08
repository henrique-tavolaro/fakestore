
import 'dart:async';
import 'dart:developer';
import 'package:fakestore/app/core/config/injection.dart';
import 'package:fakestore/app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../firebase_options.dart';
import 'core/flavor/flavors.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future<void> buildMain(Flavor flavor) async {
  appFlavor = flavor;

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await configureDependencies();

  FlutterError.onError = (details) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(

      () async => runApp(
          MyApp(flavor: flavor,)
      ),
      (error, stackTrace) {
        FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
        log(error.toString(), stackTrace: stackTrace);
      });
}