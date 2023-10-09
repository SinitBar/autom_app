import 'dart:io' show Platform;

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
  final appId = Platform.isAndroid
      ? '1:260525385053:android:b44c4e966c2f57914e34b4'
      : '1:260525385053:ios:12260ed178255c124e34b4';
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyDWOJP2_cITU08hvR2iV1Wly7ST2FPr7kU',
          appId: appId,
          messagingSenderId: '260525385053',
          projectId: 'autom-register'));
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
