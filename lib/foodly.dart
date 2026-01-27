import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_backup/config/utils/colors.dart';
import 'package:foodly_backup/config/utils/routes.dart';
import 'package:foodly_backup/core/localization/app_localizations.dart';
import 'package:foodly_backup/features/auth/sign_in/managers/sign_in_bloc.dart';
import 'package:foodly_backup/features/auth/sign_up/managers/sign_up_bloc.dart';
import 'package:foodly_backup/features/auth/forgot_password/managers/forgot_password_bloc.dart';
import 'package:foodly_backup/features/courses/managers/courses_bloc.dart';
import 'package:foodly_backup/features/discovery/managers/discovery_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Foodly extends StatelessWidget {
  final String initialRoute;

  const Foodly({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignInBloc(FirebaseAuth.instance)),
        BlocProvider(create: (_) => SignUpBloc(FirebaseAuth.instance)),
        BlocProvider(create: (_) => ForgotPasswordBloc(FirebaseAuth.instance)),
        BlocProvider(create: (_) => CoursesBloc()),
        BlocProvider(create: (_) => DiscoveryBloc()),
      ],
      child: MaterialApp(
        title: 'Foodly',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: initialRoute, // ✅ Use the route passed from main.dart
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: background,
          colorScheme: ColorScheme.fromSeed(seedColor: background),
          appBarTheme: AppBarTheme(
            backgroundColor: background,
            actionsIconTheme: const IconThemeData(size: 20),
            elevation: 2,
            toolbarHeight: 50,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        ),
      ),
    );
  }
}
