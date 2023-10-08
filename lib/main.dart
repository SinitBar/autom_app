import 'package:autom_app/presentation/screens/loading_screen.dart';
import 'package:autom_app/presentation/screens/login_or_register_screen/login_or_register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'constants.dart';
import 'data/RepositoryImpl.dart';

final getIt = GetIt.instance;

void setup() async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getIt.registerSingleton<RepositoryImpl>(RepositoryImpl());
  runApp(const AutomAppRegister());
}

class AutomAppRegister extends StatelessWidget {
  const AutomAppRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kRedColor),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      routes: {
        LoadingScreen.id: (context) => const LoadingScreen(),
        LoginOrRegisterScreen.id: (context) => const LoginOrRegisterScreen(),
      },
      initialRoute: LoadingScreen.id,
    );
  }
}
