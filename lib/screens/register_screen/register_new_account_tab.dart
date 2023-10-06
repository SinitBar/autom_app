import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/designed_checkbox.dart';
import '../../widgets/designed_text_button.dart';
import '../../widgets/designed_text_field.dart';

class RegisterNewAccountTab extends StatefulWidget {
  const RegisterNewAccountTab({super.key});

  @override
  State<RegisterNewAccountTab> createState() => _RegisterNewAccountTabState();
}

class _RegisterNewAccountTabState extends State<RegisterNewAccountTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Регистрация нового аккаунта',
          style: kTextStyle,
        ),
        DesignedTextField(
          labelText: 'Номер телефона',
        ),
        DesignedTextButton(
          text: 'Выслать SMS-код',
          onPressCallback: () {},
        ),
        DesignedTextButton(
          text: 'Выслать повторно',
          onPressCallback: () {},
          backgroundColor: Colors.white,
          textColor: kRedColor,
        ),
        DesignedTextField(
          labelText: 'Код из SMS',
        ),
        Row(
          children: [
            DesignedCheckbox(
              checkedChangedCallback: () {},
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text('Ознакомлен с'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Договором оферты',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('и согласен на'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Рассылку',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        DesignedTextButton(
          text: 'Далее',
          onPressCallback: () {},
        ),
      ],
    );
  }
}
