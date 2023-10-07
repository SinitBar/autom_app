import 'package:autom_app/presentation/screens/loading_screen.dart';
import 'package:autom_app/presentation/screens/login_or_register_screen/login_or_register_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
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
