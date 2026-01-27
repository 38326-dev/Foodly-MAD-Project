import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodly_backup/config/utils/routes.dart';
import 'package:foodly_backup/foodly.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 1. Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 2. Initialize HydratedBloc Storage properly
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
  );

  // 3. System UI Settings
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  final startWidget = await getInitialScreen();
  FlutterNativeSplash.remove();

  runApp(Foodly(initialRoute: startWidget));
}

Future<String> getInitialScreen() async {
  try {
    final auth = FirebaseAuth.instance;
    final prefs = await SharedPreferences.getInstance();
    final user = auth.currentUser;

    if (user == null) return RouteGenerator.signIn;

    // Optional: Check inactivity logic here
    return RouteGenerator.initialRoute;
  } catch (e) {
    return RouteGenerator.signIn;
  }
}
