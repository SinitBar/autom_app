import 'package:flutter/material.dart';

import '../../constants.dart';
import 'login_or_register_screen/login_or_register_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  static String id = '/loading_page';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).popAndPushNamed(LoginOrRegisterScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ColoredBox(
        color: kRedColor,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 80),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/Wheel.png',
              ),
            ),
          ),
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  width: 256,
                  height: 256,
                  image: AssetImage(
                    'assets/images/Logo_Default.gif',
                  ),
                ),
                Text(
                  kLogoText,
                  style: kLogoTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
