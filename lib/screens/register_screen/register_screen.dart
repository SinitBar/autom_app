import 'package:autom_app/constants.dart';
import 'package:autom_app/screens/register_screen/register_new_account_tab.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = '/register_screen';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: kRedColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Widget>[
              Tab(
                text: 'Войти',
              ),
              Tab(
                text: 'Регистрация',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text('Enter logic'),
            ),
            RegisterNewAccountTab(),
          ],
        ),
      ),
    );
  }
}
