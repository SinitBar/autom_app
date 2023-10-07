import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../constants.dart';
import '../../widgets/designed_checkbox.dart';
import '../../widgets/designed_text_button.dart';
import '../../widgets/designed_text_field.dart';
import '../../widgets/link_button.dart';

class RegisterNewAccountTab extends StatefulWidget {
  const RegisterNewAccountTab({super.key});

  @override
  State<RegisterNewAccountTab> createState() => _RegisterNewAccountTabState();
}

class _RegisterNewAccountTabState extends State<RegisterNewAccountTab> {
  late final MaskTextInputFormatter phoneFormatter;

  late final MaskTextInputFormatter smsCodeFormatter;

  late bool canGoNext;

  @override
  void initState() {
    phoneFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      type: MaskAutoCompletionType.eager,
    );
    smsCodeFormatter = MaskTextInputFormatter(
      mask: '####',
      type: MaskAutoCompletionType.eager,
    );
    canGoNext = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Text(
            'Регистрация нового аккаунта',
            style: kTextStyle,
          ),
          DesignedTextField(
            labelText: 'Номер телефона',
            formatter: phoneFormatter,
            isPhone: true,
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
            formatter: smsCodeFormatter,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DesignedCheckbox(
                checkedChangedCallback: (bool value) {
                  setState(() {
                    canGoNext = value;
                  });
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Ознакомлен с',
                        style: kGreyTextStyle,
                      ),
                      LinkButton(
                        text: 'Договором оферты',
                        onTapCallback: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'и согласен на',
                        style: kGreyTextStyle,
                      ),
                      LinkButton(
                        text: 'Рассылку',
                        onTapCallback: () {},
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          //if (canGoNext)
          DesignedTextButton(
            text: 'Далее',
            onPressCallback: () {
              if (canGoNext) {
                // go to the next page
              } else {
                // maybe show error dialog
              }
            },
          ),
        ],
      ),
    );
  }
}
